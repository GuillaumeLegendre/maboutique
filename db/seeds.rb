# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless DefaultTemplate.find_by_name("Beauté, Coiffure")
  DefaultTemplate.create(
    name: "Beauté, Coiffure",
    subject: "Beauté, Coiffure",
    body: "<table style=\"border : 0\"><tbody><tr><td><img class=\"img-circle\" src=\"http://maboutique.pro/uploads/image/picture/17/logo2.jpg\" style=\"width: 225.833px; height: 93.6px;\"></td><td style=\"text-align: center;\"><p>Du 1 mars au 30 avril 2015<span style=\"font-family: Verdana;\"><span style=\"color: rgb(165, 74, 123);\"><br></span></span></p><h4><span style=\"font-family: Verdana;\"><span style=\"color: rgb(165, 74, 123);\">Des offres exceptionnelles pour changer d'Hair !</span></span></h4><hr></td></tr><tr><td><img src=\"http://maboutique.pro/uploads/image/picture/18/offre.jpg\" style=\"width: 351.833px; height: 226.65px;\"><p><br></p></td><td><h4><span style=\"color: rgb(115, 24, 66);\"><span style=\"font-weight: bold;\">&nbsp;&nbsp; - 30%</span></span> sur la coupe + brushing*<br></h4><hr><h4><span style=\"font-weight: bold;\"><span style=\"color: rgb(49, 24, 115);\">&nbsp;&nbsp; - 20%</span></span> sur la couleur*</h4><hr><h4><span style=\"color: rgb(99, 74, 165);\"><span style=\"font-weight: normal;\">&nbsp;&nbsp; - 10%</span></span> sur la coupe enfant (- de 10 ans)*</h4><hr><h4><span style=\"color: rgb(206, 0, 0);\"><span style=\"font-weight: normal;\">&nbsp;&nbsp; - 15%</span></span> sur la coupe homme*</h4></td></tr><tr align=\"center\"><td colspan=\"2\"><span style=\"text-decoration: underline;\"><span style=\"color: rgb(165, 74, 123);\">Le petit plus du moment</span></span> : Une manucure offerte pendant votre visite (Uniquement sur Rendez-vous)<br><hr></td></tr><tr><td colspan=\"2\"><h6><span style=\"color: rgb(74, 16, 49);\">* Offres réservées à nos clients et valables sur présentation de cet email</span></h6><hr><h6><span style=\"color: rgb(74, 16, 49);\"></span></h6></td></tr><tr><td colspan=\"2\"><p style=\"text-align: center;\">Vous ne souhaitez plus recevoir d'offres de notre part : <a target=\"_blank\" href=\"mailto:contact@diminutifs.com\">contact@diminutifs.com</a></p><table class=\"table table-bordered\"></table></td></tr></tbody></table>",
    img: "/global/img/default_template/salon_coiffure.jpg"
  )
end

unless DefaultTemplate.find_by_name("restaurant évènement")
  DefaultTemplate.create(
    name: "restaurant évènement",
    subject: "restaurant évènement",
    body: "<table border=\"0\" width=\"700\"><tbody><tr><td width=\"400\"><img src=\"http://maboutique.pro/uploads/image/picture/22/LAPIZZ.jpg\" style=\"width: 228.84375px; height: 122px;\" class=\"img-rounded\"></td><td style=\"text-align: center; \">12, rue des Diables bleus - 38230 Charvieu</td></tr><tr><td><h3><hr><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143; color: inherit; font-family: inherit;\">Cher client(e),</span></div><span style=\"line-height: 1.42857143;\"><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143; color: inherit; font-family: inherit;\">Vendredi midi et soir</span></div></span></h3><h2 style=\"text-align: center;\"><span style=\"font-weight: bold; color: rgb(206, 0, 0);\">Pizza à volonté !</span></h2><hr></td><td><img src=\"http://maboutique.pro/uploads/image/picture/23/pizza.png\" style=\"width: 353.6875px; float: right; height: 186px;\" class=\"img-rounded\"><p><br></p></td></tr><tr><td colspan=\"2\" style=\"text-align: center; \"><h2><span style=\"color: rgb(57, 123, 33);\"><span style=\"text-decoration: underline; font-weight: bold; font-style: italic;\">Pensez à réserver</span><span style=\"font-weight: bold; font-style: italic;\"> </span>:</span> 06 00 01 02 03</h2></td></tr></tbody></table>",
    img: "/global/img/default_template/restaurant.jpg"
  )
end

unless DefaultTemplate.find_by_name("restaurant menus")
  DefaultTemplate.create(
    name: "restaurant menus",
    subject: "restaurant menus",
    body: "<table border=\"0\"><tbody><tr><td><h3 style=\"text-align: center; \"><img src=\"http://www.maboutique.pro/uploads/image/picture/32/LAFOURCHETTE.jpg\" style=\"width: 25%;\">&nbsp;<span style=\"color: rgb(247, 247, 247); background-color: rgb(41, 82, 24);\">-NOS PLATS DU JOUR DU 2 AU 6 MARS</span></h3></td></tr><tr><td><hr><p></p><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143; color: rgb(181, 214, 165);\">LUNDI :</span><span style=\"line-height: 1.42857143;\"> RISOTTO AUX CÈPES</span></div><span style=\"color: rgb(148, 189, 123);\"><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143;\">MARDI :</span><span style=\"line-height: 1.42857143; color: rgb(99, 110, 123);\"> FILET MIGON ET SA POËLÉE DE LÉGUMES</span></div></span><span style=\"color: rgb(107, 165, 74);\"><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143;\">MERCREDI</span><span style=\"line-height: 1.42857143; color: rgb(181, 214, 165);\"> :</span><span style=\"line-height: 1.42857143; color: rgb(99, 110, 123);\"> PIÈCE DE BOEUF ET FRITES FRAÎCHES</span></div></span><span style=\"color: rgb(57, 123, 33);\"><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143;\">JEUDI</span><span style=\"line-height: 1.42857143; color: rgb(148, 189, 123);\"> :</span><span style=\"line-height: 1.42857143; color: rgb(99, 110, 123);\"> TARTIFLETTE</span></div></span><span style=\"color: rgb(41, 82, 24);\"><div style=\"text-align: center;\"><span style=\"line-height: 1.42857143;\">VENDREDI</span><span style=\"line-height: 1.42857143; color: rgb(148, 189, 123);\"> :</span><span style=\"line-height: 1.42857143; color: rgb(99, 110, 123);\"> MARMITE DU PÊCHEUR ET SES LÉGUMES</span></div></span><p></p><hr></td></tr><tr><td style=\"text-align: center; \"><h4><span style=\"font-style: italic; font-weight: bold;\">- <span style=\"color: rgb(107, 165, 74);\">APÉRITIF MAISON OFFERT </span>SUR PRÉSENTATION DE CE MAIL -</span></h4></td></tr></tbody></table><p><br></p>",
    img: "/global/img/default_template/LAFOURCHETTE.jpg"
  )
end

unless DefaultTemplate.find_by_name("habillement")
  DefaultTemplate.create(
    name: "habillement",
    subject: "habillement",
    body: "<table class=\"table-bordered\" =\"=\"\"><tbody><tr><td><img src=\"http://maboutique.pro/uploads/image/picture/25/logocouture.jpg\" style=\"width: 300px;\"></td><td style=\"text-align: center; \"><h2><span style=\"background-color: rgb(165, 74, 123);\"><font color=\"#efefef\">Du 1er au 30 juin 2015</font></span></h2></td></tr><tr><td colspan=\"2\"><img src=\"http://maboutique.pro/uploads/image/picture/26/patchwork-112548_640.jpg\" style=\"width: 640px;\"></td></tr><tr><td colspan=\"2\" style=\"text-align: center; \"><h2><font style=\"background-color: rgb(57, 123, 33);\" color=\"#ffe79c\">EXPOSITION DE PATCHWORK</font></h2><h2>Retrouvez les créations originales de Dany</h2><br><font color=\"#ce0000\">Possibilité d'ateliers :</font> nous contactez pour plus d'informations au : 02 38 24 56 97</td></tr><tr><td colspan=\"2\"><img src=\"http://maboutique.pro/uploads/image/picture/27/patchwork-112548_640.jpg\" style=\"width: 640px;\"></td></tr></tbody></table><p><br></p>",
    img: "/global/img/default_template/mercerie.jpg"
  )
end

unless DefaultTemplate.find_by_name("boutiques diverses")
  DefaultTemplate.create(
    name: "boutiques diverses",
    subject: "boutiques diverses",
    body: "<table class=\"table table-bordered\" style=\"width: 715px; height: 177px;\"><tbody><tr><td><img style=\"width: 240.5px; float: none; height: 49.3025px;\" src=\"http://maboutique.pro/uploads/image/picture/8/logo.jpg\"></td><td rowspan=\"4\"><img src=\"http://maboutique.pro/uploads/image/picture/19/verre.jpg\" style=\"width: 190.833px; height: 324.6px;\"></td></tr><tr><td align=\"center\"><font size=\"4\" &gt;<span=\"\" style=\"font-family: Arial;\">Cher client(e),<br>Pour vous remercier de <span class=\"Apple-style-span\" style=\"font-weight: bold;\">votre fidélité</span> <br>profitez de notre <span class=\"Apple-style-span\" style=\"color: rgb(156, 0, 0);\">SEMAINE FOLLE</span> :<br><p></p></font></td></tr><tr><td style=\"text-align: center;\"><div><span style=\"background-color: inherit;\"><font style=\"background-color: rgb(99, 0, 0);\" color=\"#ffffff\" size=\"4\">&nbsp;DU 17 AU 28 MARS 2015</font></span></div><div><span style=\"background-color: inherit;\"><font style=\"background-color: rgb(99, 0, 0);\" color=\"#ffffff\" size=\"5\">- 20 % SUR TOUT LE MAGASIN</font></span></div></td></tr><tr><td style=\"text-align: center;\"><h4><span class=\"Apple-style-span\" style=\"color: rgb(115, 24, 66);\">La Cave à vins</span> I 18, rue du lapin bleu - 69005 Lyon I</h4></td></tr></tbody></table>",
    img: "/global/img/default_template/cave_a_vin.jpg"
  )
end
