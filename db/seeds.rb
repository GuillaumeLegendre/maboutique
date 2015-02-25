# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless DefaultTemplate.find_by_name("Salon de coiffure")
  DefaultTemplate.create(
    name: "Salon de coiffure",
    subject: "Salon de coiffure",
    body: "<table style=\"border : 0\"><tbody><tr><td><img class=\"img-circle\" src=\"http://maboutique.pro/uploads/image/picture/17/logo2.jpg\" style=\"width: 225.833px; height: 93.6px;\"></td><td style=\"text-align: center;\"><p>Du 1 mars au 30 avril 2015<span style=\"font-family: Verdana;\"><span style=\"color: rgb(165, 74, 123);\"><br></span></span></p><h4><span style=\"font-family: Verdana;\"><span style=\"color: rgb(165, 74, 123);\">Des offres exceptionnelles pour changer d'Hair !</span></span></h4><hr></td></tr><tr><td><img src=\"http://maboutique.pro/uploads/image/picture/18/offre.jpg\" style=\"width: 351.833px; height: 226.65px;\"><p><br></p></td><td><h4><span style=\"color: rgb(115, 24, 66);\"><span style=\"font-weight: bold;\">&nbsp;&nbsp; - 30%</span></span> sur la coupe + brushing*<br></h4><hr><h4><span style=\"font-weight: bold;\"><span style=\"color: rgb(49, 24, 115);\">&nbsp;&nbsp; - 20%</span></span> sur la couleur*</h4><hr><h4><span style=\"color: rgb(99, 74, 165);\"><span style=\"font-weight: normal;\">&nbsp;&nbsp; - 10%</span></span> sur la coupe enfant (- de 10 ans)*</h4><hr><h4><span style=\"color: rgb(206, 0, 0);\"><span style=\"font-weight: normal;\">&nbsp;&nbsp; - 15%</span></span> sur la coupe homme*</h4></td></tr><tr align=\"center\"><td colspan=\"2\"><span style=\"text-decoration: underline;\"><span style=\"color: rgb(165, 74, 123);\">Le petit plus du moment</span></span> : Une manucure offerte pendant votre visite (Uniquement sur Rendez-vous)<br><hr></td></tr><tr><td colspan=\"2\"><h6><span style=\"color: rgb(74, 16, 49);\">* Offres réservées à nos clients et valables sur présentation de cet email</span></h6><hr><h6><span style=\"color: rgb(74, 16, 49);\"></span></h6></td></tr><tr><td colspan=\"2\"><p style=\"text-align: center;\">Vous ne souhaitez plus recevoir d'offres de notre part : <a target=\"_blank\" href=\"mailto:contact@diminutifs.com\">contact@diminutifs.com</a></p><table class=\"table table-bordered\"></table></td></tr></tbody></table>",
    img: "/global/img/default_template/salon_coiffure.jpg"
  )
end
