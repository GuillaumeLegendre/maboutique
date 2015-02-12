class PayementController < ApplicationController
  before_filter :authenticate_user! :except => [:ipn_notification_year, :ipn_notification_credits]
  protect_from_forgery :except => [:ipn_notification_year, :ipn_notification_credits]
  layout "backoffice"

  def index
  end

  def pay_monthly

  end

  def buy_one_year
    pay_request = PaypalAdaptive::Request.new
    amount = 190
    data = {
      "returnUrl" => registration_successfully_payement_index_url,
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"EUR",
      "receiverList"=>{"receiver"=>
         [{"email"=>"quicksite.contact@gmail.com", "amount"=> amount}]},
      "cancelUrl"=> canceled_payement_index_url,
      "actionType"=>"PAY",
      "ipnNotificationUrl"=> "#{request.protocol}#{request.host_with_port}/payement/ipn_notification_year?user_id=" + current_user.id.to_s
    }

    pay_response = pay_request.pay(data)

    if pay_response.success?
      redirect_to pay_response.approve_paypal_payment_url
    else
      puts pay_response.errors.first['message'] #TODO see in what case and maybe send mail
      redirect_to canceled_payement_index_path
    end
  end

  def pay_sms
    pay_request = PaypalAdaptive::Request.new
    credits = params[:sms][:number].to_f
    if credits <= 0
      return redirect_to payement_index_path, :alert => "Le nombre de crédits entré est incorect"
    end
    amount = credits * 6 / 100
    data = {
      "returnUrl" => credits_successfully_payement_index_url,
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"EUR",
      "receiverList"=>{"receiver"=>
         [{"email"=>"quicksite.contact@gmail.com", "amount"=> amount}]},
      "cancelUrl"=> canceled_payement_index_url,
      "actionType"=>"PAY",
      "ipnNotificationUrl"=> "#{request.protocol}#{request.host_with_port}/payement/ipn_notification_credits?user_id=#{current_user.id.to_s}&credits=#{credits}"
    }

    pay_response = pay_request.pay(data)

    if pay_response.success?
      redirect_to pay_response.approve_paypal_payment_url
    else
      puts pay_response.errors.first['message'] #TODO see in what case and maybe send mail
      redirect_to canceled_payement_index_path
    end
  end

  def registration_successfully
    redirect_to payement_index_path, :notice => "Nous sommes en attente de la confirmation de payement par paypal (vous devez également recevoir un email de Paypal). Votre abonnement débutera dès la confirmation reçu. Si vous avez reçu l'email de validation de Paypal mais que votre abonnement n'à pas commencé n'hésitez pas à nous appeler."
  end

  def credits_successfully
    redirect_to payement_index_path, :notice => "Nous sommes en attente de la confirmation de payement par paypal (vous devez également recevoir un email de Paypal). Vos crédits seront accessible dès la confirmation reçu. Si vous avez reçu l'email de validation de Paypal mais que votre compte n'à pas été crédité n'hésitez pas à nous appeler."
  end

  def canceled
    redirect_to payement_index_path, :alert => "L'achat a été annulé. Votre compte n'a pas été débité."
  end

  def ipn_notification_year
    ipn = PaypalAdaptive::IpnNotification.new
    ipn.send_back(request.raw_post)
    if ipn.verified?
      u = User.find(params[:user_id])
      if u.end_subscription > Date.now
        new_end_date = u.end_subscription.next_year
      else
        new_end_date = DateTime.now.to_date.next_year
      end
      u.update_attributes(end_subscription: new_end_date)
    else
      puts "ipn.verified? failed"
      puts ipn.inspect
    end
    render nothing: true
  end

  def ipn_notification_credits
    ipn = PaypalAdaptive::IpnNotification.new
    ipn.send_back(request.raw_post)
    if ipn.verified?
      u = User.find(params[:user_id])
      u.update_attributes(credits: u.credits + params[:credits])
    else
      puts "ipn.verified? failed"
      puts ipn.inspect
    end
    render nothing: true
  end
end
