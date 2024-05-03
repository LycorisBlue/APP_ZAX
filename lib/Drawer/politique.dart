import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/main.dart';

class PolitiqueConfidentialitePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold(
      backgroundColor: gris_clair,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Text(
              'POLITIQUE DE CONFIDENTIALITÉ',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: orange,
              ),
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Politiques de confidentialité et d\'utilisation de cookies du site HATOOH-CI.COM et des applications HATOOH',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Le présent manuel décrit la politique de confidentialité et la politique d\'utilisation de cookies sur notre site et nos applications. Ces politiques sont établies conformément à la loi ivoirienne n°2013-450 du 19 juin 2013 relative à la protection des données à caractère personnel. Elles peuvent faire l\'objet de mises à jour périodiques en fonction de l\'évolution de la légalisation en vigueur et des besoins techniques du site web HATOOH-CI.COM et des applications HATOOH.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                'I - NOTRE POLITIQUE DE CONFIDENTIALITÉ',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'La présente politique de confidentialité décrit la manière dont nous traitons vos données à caractère personnel sur notre site et sur nos applications. En tant que responsable de traitement des données collectées sur le site web HATOOH-CI.COM et sur les applications HATOOH, nous accordons un intérêt particulier au respect de votre vie privée et à la sécurité de vos données à caractère personnel.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'À cet effet, nous vous communiquons les informations utiles suivantes :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              '1 - Qu\'est-ce qu\'une donnée à caractère personnel ?',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 22,
                color: orange,
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Une donnée à caractère personnel ou une donnée personnelle est toute information de quelque nature qu\'elle soit et indépendamment de son support y compris le son et l\'image relative à une personne physique identifiée ou identifiable directement ou indirectement, par référence à un numéro d\'identification ou à un ou plusieurs éléments spécifiques, propres à son identité physique, physiologique, génétique, psychique, culturelle, social ou économique. Autrement dit, une donnée à caractère personnel est une donnée qui permet d\'identifier directement ou indirectement une personne.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '2 - Quelles sont vos données à caractère personnel  que nous collectons ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous collectons uniquement les données à caractère personnel que vous nous fournissez à travers les formulaires d\'enregistrement, les courriels, les réservations, les offres ou toutes autres situations pour lesquelles vous avez accepté de nous fournir des informations personnelles.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Il s\'agit notamment des données à caractère personnel suivantes :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Vos nom et prénoms.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Votre adresse.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Votre adresse mail.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Votre numéro de téléphone.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Vos informations de paiement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Votre adresse IP.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le navigateur que vous utilisez et vos paramètres de langue.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Votre localisation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Etc.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Ces données sont collectées pour de bonnes raisons. En effet, nous utilisons ces données pour vous aider à organiser vos réservations en ligne, et nous assurer que vous obtenez le meilleur service possible.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous utilisons également vos données personnelles pour vous informer de nos dernières réductions, de nos offres spéciales et d\'autres produits ou services qui, selon nous, pourraient vous intéresser.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Toutefois, nous conservons vos données à caractère personnel uniquement pendant la période nécessaire aux finalités pour lesquelles elles ont été collectées.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '3 - Avec qui partageons-nous vos données à caractère personnel ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En tant que plateformes de réservation, le site web HATOOH-CI.COM et les applications HATOOH sont des plateformes de liaison entre les usagers et les prestataires de services dans le domaine de l\'affrètement des avions privés, de l\'hébergement, des attractions, des navettes aéroportuaires et de la location de voitures et de bateaux, etc.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Ainsi, pour une meilleure prise en charge de vos réservations, nous communiquons vos données personnelles aux prestataires de services dont les offres de services sont disponibles sur notre site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vos données personnelles peuvent également être communiquées à d\'autres tiers avec lesquels nous travaillons afin de vous faire bénéficier des services du site web HATOOH-CI.COM et des applications HATOOH. Il peut s\'agir d\'institutions financières, d\'annonceurs et des autres agences de la société HATOOH.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Dans certains cas et si la législation ivoirienne l\'exige, vos données pourront être communiquées aux autorités judiciaires et/ou administratives.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cependant, nous nous efforcerons d\'empêcher la divulgation non autorisée de vos données personnelles par d\'autres personnes, mais nous déclinons toute responsabilité pour les divulgations non autorisées ou les autres violations de sécurité ou les actions d\'autres personnes, si les données personnelles leur ont été transmises sous votre autorité ou sous l\'autorité d\'une autre personne, à moins que ce ne soit sous notre autorité.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Enfin, nous nous réservons également le droit de partager vos données personnelles avec un acquéreur potentiel dans le cadre d\'un éventuel rachat, d\'une éventuelle fusion ou d\'une éventuelle acquisition de l\'une quelconque de nos activités.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '4 - Quels sont vos droits eu égard à vos données à caractère personnel ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Avant tout traitement de vos données par le site HATOOH-CI.COM et par les applications HATOOH, votre consentement expresse sera requis. Conformément à la législation en vigueur, vous avez les droits suivants :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le droit d\'accès à vos données personnelles collectées.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le droit de rectification de vos données personnelles collectées.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le droit de vous opposer au traitement de vos données personnelles pour des motifs légitimes tenant à votre situation particulière.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le droit de vous opposer au traitement des données à des fins de prospection.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le droit de rectification, de suppression, de verrouillage ou de mise à jour de vos données qui sont inexactes, incomplètes, équivoques ou périmées.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous pouvez exercer ces droits en nous contactant aux coordonnées ci-dessous.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous avez également le droit de déposer une réclamation ou une plainte auprès de l\'Autorité de Protection des Données (ARTCI) en Côte d\'Ivoire.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                '5 - Comment nous contacter ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'HATOOH contrôle le traitement des données collectés sur le site HATOOH-CI.COM et sur les applications HATOOH, tel que décrit dans la présente politique de confidentialité, sauf indication contraire explicite. HATOOH est une société à responsabilité limitée de Droit ivoirien dont le siège social est sis à Grand-Bassam (Côte d\'Ivoire), 18 BP 1563 Abidjan 18.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Si vous avez des questions à propos de cette politique de confidentialité ou du traitement de vos données personnelles, contactez notre délégué à la protection des données via le lien suivant : support@hatooh-ci.com et nous vous reviendrons dans les meilleurs délais.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'II - NOTRE POLITIQUE D\'UTILISATION DES COOKIES ',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                '1 - Qu\'est-ce qu\'un cookie ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Le terme « cookie » ou « traceur » désigne de petits fichiers contenant une chaîne de caractères, stockés par votre navigateur internet sur votre terminal (ordinateur, mobile, tablette etc.).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En d\'autres termes, un cookie est un fichier qui est déposé par le navigateur sur votre ordinateur lorsque vous surfez sur internet.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '2 - À quoi servent les cookies utilisés par HATOOH-CI.COM ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Les cookies ont de multiples usages.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'La plupart de cookies ne servent qu\'à optimiser votre navigation sur le iite Internet et vous permettre d\'accéder à certains services sur notre site HATOOH-CI.COM et sur nos applications HATOOH. Un refus de ces cookies peut donc dégrader votre expérience sur notre site web et sur nos applications, voire vous empêcher d\'accéder à certains services proposés par la société HATOOH.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Des cookies indispensables à la fourniture du service que vous avez demandé peuvent également être déposés. Ils servent à mémoriser votre identifiant d\'utilisateur sur notre site. Ainsi ils permettent par exemple de maintenir votre session ouverte lors de votre navigation sur le Site HATOOH-CI.COM, après que vous vous soyez identifié et jusqu\'à votre déconnexion.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Certains cookies servent à des fins statistiques afin de mesurer l\'efficacité des campagnes publicitaires. Ils permettent aussi de réaliser des opérations de prospection adaptées concernant nos services et nos offres.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Les informations obtenues grâce aux cookies sont utilisées par nous-même et par des tiers qui agissent pour notre compte à l\'effet de vous proposer des publicités en lien avec vos préférences.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cependant, les cookies ne nous permettent en aucun cas d\'accéder à votre ordinateur et/ou équipement ou à toute information vous concernant, à l\'exception des données que vous choisissez de partager avec nous.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '3 - Comment gérer vos droits et préférences en matière de cookies sur notre site et nos applications ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Le stockage de cookies sur votre terminal requiert votre consentement, sauf lorsque qu\'ils sont strictement nécessaires pour vous fournir un service que vous avez demandé ou ont pour finalité exclusive de permettre ou faciliter la communication par voie électronique. Ces cookies sont conservés uniquement pendant la durée de votre session.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Lors de votre visite sur notre site internet ou sur nos applications, un bandeau vous informe de la présence de cookies et vous invite à consentir ou non à leur stockage sur votre terminal. Ils ne sont stockés que si vous les acceptez ou si vous poursuivez votre navigation sur le site internet en visitant une seconde page du Site HATOOH-CI.COM ou en cliquant sur un élément du site internet. Il en est de même des visites via les applications HATOOH. Ce consentement est valable pendant 13 mois, après quoi il vous sera à nouveau demandé. Les cookies sont conservés pendant 13 mois.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous pouvez modifier à tout moment le paramétrage des cookies déposés par le site web HATOOH-CI.COM ou par les applications HATOOH.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Si vous préférez ne pas recevoir ces cookies, vous pouvez à tout moment choisir de les désactiver en modifiant les paramètres de votre navigateur. Vous pouvez les accepter ou les refuser au cas par cas ou bien les refuser systématiquement une fois pour toutes. Nous attirons votre attention sur le fait que limiter leur utilisation peut entraîner une dégradation de la navigation sur le site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'La configuration de chaque navigateur est différente. Elle est décrite dans le menu d\'aide de votre navigateur, qui vous permettra de savoir de quelle manière modifier vos souhaits en matière de cookies.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous pouvez donc suivre l\'un des procédés suivants :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Paramétrage de votre navigateur',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous avez également la possibilité de paramétrer la réception de cookies sur votre terminal au moyen de l\'option « préférences Internet » de votre navigateur. Néanmoins, le refus de certains cookies peut réduire voire rendre impossible votre accès à certains services proposés sur le site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous pouvez vous opposer à l\'enregistrement de cookies sur votre terminal en paramétrant votre navigateur de la manière suivante :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Firefox',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez sur le bouton de Menu et sélectionnez Options.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Sélectionnez le panneau Vie privée et sécurité et rendez-vous à la section Historique.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Dans le menu déroulant Règles de conservation, choisissez Utiliser les paramètres personnalisés pour l\'historique.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Décochez la case Accepter les cookies.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Google Chrome',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez sur Plus, puis sur Paramètres, puis Paramètres avancés.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Dans la section Confidentialité et sécurité, cliquez sur Paramètres du contenu, puis sur Cookies.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Désactivez Autoriser les sites à enregistrer/lire les données des cookies.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Microsoft Internet Explorer ',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez Outils, puis Options Internet.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Sélectionnez l\'onglet Confidentialité, puis sous Paramètres, sélectionnez Avancé. Choisissez si vous souhaitez autoriser, bloquer ou être invité à déterminer la configuration voulue pour les cookies internes et tiers.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Safari',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez sur Préférences, puis sur Confidentialité.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Sélectionnez une option relative aux Cookies et données de site web.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Paramétrage de votre smartphone iOS',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez sur Réglages, puis Safari.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Dans la rubrique Confidentialité et sécurité, activez Bloquer tous les cookies.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Android',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez sur Plus, puis sur Paramètres, puis Paramètres du site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Dans la rubrique Cookies, désactivez l\'option Cookies.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                'Windows Phone',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Cliquez sur Paramètres, puis Paramètres avancés.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Dans le menu déroulant Cookies de sites Web, sélectionnez Les bloquer tous.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Enfin, vous pouvez régulièrement détruire les cookies stockés sur votre terminal.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous pouvez choisir d\'accepter ou de refuser les cookies. La plupart des navigateurs internet acceptent automatiquement les cookies mais vous pouvez modifier le réglage de votre navigateur pour refuser les cookies si vous préférez.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
