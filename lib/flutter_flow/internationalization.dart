import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OnboardingPage
  {
    'c43slshj': {
      'en': 'Travel with peace of mind !',
      'fr': 'Voyagez en toute sérénité !',
    },
    'z3r8ydmh': {
      'en': 'Find 100% pet-friendly stays near you in seconds.',
      'fr':
          'Trouvez des hébergements 100% acceptant les animaux de compagnie près de chez vous en quelques secondes.',
    },
    'ktlp2ll6': {
      'en': 'Skip',
      'fr': 'Sauter',
    },
    'ftsofplt': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    'lypnv3dh': {
      'en': 'Book in one click !',
      'fr': 'Réservez en un clic !',
    },
    'p2lbm9vm': {
      'en': 'Manage your dates, your companion, and your budget effortlessly',
      'fr': 'Gérez vos dates, votre compagnon et votre budget sans effort',
    },
    '69efgth4': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    '1a511vhx': {
      'en': 'Skip',
      'fr': 'Sauter',
    },
    '5u8um9ux': {
      'en': 'Earn rewards !',
      'fr': 'Gagnez des récompenses !',
    },
    'ke8fp6l6': {
      'en': 'Collect points and unlock badges for every trip with your pet',
      'fr':
          'Cumulez des points et débloquez des badges pour chaque voyage avec votre animal de compagnie',
    },
    '77334978': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    'as4w88yu': {
      'en': 'Begin',
      'fr': 'Commencer',
    },
    '7ipo1ss9': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SignUpPage
  {
    'bf65c1er': {
      'en': 'PetInn',
      'fr': 'PetInn',
    },
    'gy8u0rkq': {
      'en': 'Sign up for free',
      'fr': 'Inscrivez-vous gratuitement',
    },
    'uurxr0ao': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'a7wtcpsc': {
      'en': '*',
      'fr': '*',
    },
    'ok83l9oe': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'fyn0kgwu': {
      'en': 'Phone number',
      'fr': 'Numéro de téléphone',
    },
    '40b2ooj6': {
      'en': '*',
      'fr': '*',
    },
    '7403zuqq': {
      'en': 'Phone number',
      'fr': 'Numéro de téléphone',
    },
    'ofp37nq6': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'ofk8rfon': {
      'en': '*',
      'fr': '*',
    },
    'dp0htgzp': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'o63asogb': {
      'en': 'Remember me',
      'fr': 'Souviens-toi de moi',
    },
    'iqxymk7e': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    '22ksqf7z': {
      'en': 'or continue with',
      'fr': 'ou continuer avec',
    },
    'kkp7pp55': {
      'en': 'Facebook',
      'fr': 'Facebook',
    },
    'mzxg4dr7': {
      'en': 'Google',
      'fr': 'Google',
    },
    '4jf57hln': {
      'en': 'Already have an account?',
      'fr': 'Vous avez déjà un compte ?',
    },
    '0gi0w73l': {
      'en': 'Sign in',
      'fr': 'Se connecter',
    },
    '24t50r91': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // LoginPage
  {
    '0u5hiyg2': {
      'en': 'PetInn',
      'fr': 'PetInn',
    },
    'hl07miah': {
      'en': 'Sign in to your account',
      'fr': 'Connectez-vous à votre compte',
    },
    'vjsprbt3': {
      'en': 'Email*',
      'fr': 'E-mail*',
    },
    'cdjtnso9': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'ud3pqgqb': {
      'en': 'Password*',
      'fr': 'Mot de passe*',
    },
    'rab5cp2n': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    '6b6feyye': {
      'en': 'Remember me',
      'fr': 'Souviens-toi de moi',
    },
    '98eqrxll': {
      'en': 'Sign in',
      'fr': 'Se connecter',
    },
    'kunt8j09': {
      'en': 'Forgot the password?',
      'fr': 'Mot de passe oublié?',
    },
    '60uu4h07': {
      'en': 'or continue with',
      'fr': 'ou continuer avec',
    },
    'itzaldyx': {
      'en': 'Facebook',
      'fr': 'Facebook',
    },
    'oudytk2y': {
      'en': 'Google',
      'fr': 'Google',
    },
    'l1ve9i8d': {
      'en': 'Don\'t have an account?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'c6s3xwmq': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    't0v3azi2': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ForgotPasswordPage
  {
    'jxlzqnze': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    'ww7voqab': {
      'en': 'Select which contact details should we use to reset your password',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
    },
    'qx2s8s6z': {
      'en': 'via SMS:',
      'fr': 'par SMS :',
    },
    'qalb0ui3': {
      'en': '+6282******39',
      'fr': '+6282******39',
    },
    'tjol51yf': {
      'en': 'via Email:',
      'fr': 'par e-mail :',
    },
    'xn1hbt12': {
      'en': 'ex***le@yourdomain.com',
      'fr': 'ex***le@votredomaine.com',
    },
    'iw3szt4b': {
      'en': 'Continue',
      'fr': 'Continuer',
    },
    '2uqjxntn': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    '68txgtgs': {
      'en': 'Code has been send to +6282******39',
      'fr': 'Le code a été envoyé au +6282******39',
    },
    'olvg4qon': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'wikduzys': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'gm8lvkwm': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'qz8nzboy': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    '12gtjwc4': {
      'en': 'Resend code in ',
      'fr': 'Renvoyer le code dans',
    },
    'kzq46mq9': {
      'en': '56',
      'fr': '56',
    },
    '49a6dgh4': {
      'en': ' s',
      'fr': 's',
    },
    'togs97tu': {
      'en': 'Verify',
      'fr': 'Vérifier',
    },
    'jnn0i3as': {
      'en': 'Reset Password',
      'fr': 'Réinitialiser le mot de passe',
    },
    'jg46ux1s': {
      'en': 'Create a new password',
      'fr': 'Créer un nouveau mot de passe',
    },
    'zu96s5lz': {
      'en': 'New Password',
      'fr': 'Nouveau mot de passe',
    },
    'pf4j49fb': {
      'en': '*',
      'fr': '*',
    },
    'w0m4taar': {
      'en': 'New Password',
      'fr': 'Nouveau mot de passe',
    },
    'zug8ji4g': {
      'en': 'Confirm New Password',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    'ltyz671k': {
      'en': '*',
      'fr': '*',
    },
    '0hrru44u': {
      'en': 'Confirm New Password',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    '2hk20i8m': {
      'en': 'Remember me',
      'fr': 'Souviens-toi de moi',
    },
    '1i8bxde3': {
      'en': 'Save',
      'fr': 'Sauvegarder',
    },
    'gjqmtm61': {
      'en': 'Congrats!',
      'fr': 'Bravo!',
    },
    'enr6h8nm': {
      'en': 'Your account is ready to use',
      'fr': 'Votre compte est prêt à être utilisé',
    },
    'ub6ucyx1': {
      'en': 'Go to Homepage',
      'fr': 'Aller à la page d\'accueil',
    },
    'y590vuzn': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // HomePage
  {
    'z2quwmkp': {
      'en': 'Hey Hasna',
      'fr': 'Salut Hasna',
    },
    'ogntzwlu': {
      'en': '👋',
      'fr': '👋',
    },
    'qxtpz704': {
      'en': '1',
      'fr': '1',
    },
    'zdffgi4o': {
      'en': 'Let\'s start your journey!',
      'fr': 'Commençons votre voyage !',
    },
    'vgzf66er': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    'ab4xcr0c': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    '6ebejib7': {
      'en': 'Date',
      'fr': 'Date',
    },
    '7pbut3d5': {
      'en': 'Date',
      'fr': 'Date',
    },
    'gvp45cj4': {
      'en': 'Guest',
      'fr': 'Invité',
    },
    'jxamdz87': {
      'en': 'Add guest',
      'fr': 'Ajouter un invité',
    },
    '15iwpwjf': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    'j6k7hlfz': {
      'en': 'Popular Hotel',
      'fr': 'Hôtel populaire',
    },
    '1tpf22xk': {
      'en': 'See all',
      'fr': 'Tout voir',
    },
    '1986o2lg': {
      'en': 'Recommended',
      'fr': 'Recommandé',
    },
    '8v7hcycc': {
      'en': 'See all',
      'fr': 'Tout voir',
    },
    'w2tv9m7r': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // NotificationsPage
  {
    'qj9fwthv': {
      'en': 'Notifications',
      'fr': 'Notifications',
    },
    'plf1qlmh': {
      'en': 'Today, December 25 2022',
      'fr': 'Aujourd\'hui, 25 décembre 2022',
    },
    's1h1n366': {
      'en': 'Payment Successful!',
      'fr': 'Paiement réussi !',
    },
    '6pft01vg': {
      'en': 'You have successfully made a payment at Owent Apartment',
      'fr': 'Vous avez effectué avec succès un paiement à Owent Apartment',
    },
    'f27dr53g': {
      'en': 'Order Canceled!',
      'fr': 'Commande annulée !',
    },
    'jxpzh440': {
      'en': 'You have canceled payment at Semie Apartment',
      'fr': 'Vous avez annulé le paiement à Semie Apartment',
    },
    'fp8w2v4s': {
      'en': 'Yesterday, December 24 2022',
      'fr': 'Hier, 24 décembre 2022',
    },
    '49514t68': {
      'en': 'New Features Available',
      'fr': 'Nouvelles fonctionnalités disponibles',
    },
    'f860fib0': {
      'en': 'You can now send pictures and videos in messages',
      'fr':
          'Vous pouvez désormais envoyer des photos et des vidéos dans des messages',
    },
    'xbe32hif': {
      'en': 'Monday, December 23 2022',
      'fr': 'Lundi 23 décembre 2022',
    },
    '8o76hagi': {
      'en': 'Payment Successful!',
      'fr': 'Paiement réussi !',
    },
    'xgwvtvxp': {
      'en': 'You have successfully made a payment at Owent Apartment',
      'fr': 'Vous avez effectué avec succès un paiement à Owent Apartment',
    },
    'u0dyg2vp': {
      'en': 'Order Canceled!',
      'fr': 'Commande annulée !',
    },
    'raul1b1s': {
      'en': 'You have canceled payment at Semie Apartment',
      'fr': 'Vous avez annulé le paiement à Semie Apartment',
    },
    'rf4sb75s': {
      'en': 'Nothing here yet',
      'fr': 'Rien ici pour le moment',
    },
    'wqeq9kik': {
      'en': 'no notification at the moment',
      'fr': 'aucune notification pour le moment',
    },
    'mlz1g12i': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // PopularPage
  {
    '4robyu6u': {
      'en': 'Recommended',
      'fr': 'Recommandé',
    },
    'qkcedd90': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // RecommendedPage
  {
    'ps53s3jr': {
      'en': 'Recommended',
      'fr': 'Recommandé',
    },
    'cpqxhxbj': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // FavoritesPage
  {
    'py620lql': {
      'en': 'Favorits',
      'fr': 'Favoris',
    },
    '34c7y4ht': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SearchResultsPage
  {
    'h93ep8kz': {
      'en': 'Bali, Indonesia',
      'fr': 'Bali, Indonésie',
    },
    'n876i0py': {
      'en': '16-20 Sep • 4 guests',
      'fr': '16-20 sept. • 4 invités',
    },
    'vv3szxes': {
      'en': '3,478 properties found',
      'fr': '3 478 propriétés trouvées',
    },
    'bmehsa21': {
      'en': 'Revelance',
      'fr': 'Pertinence',
    },
    'ruw1m1k1': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    'swcrb244': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'x1xkgdfb': {
      'en': 'Revelance',
      'fr': 'Pertinence',
    },
    'j2wad6sv': {
      'en': 'Price ascending',
      'fr': 'Prix croissant',
    },
    't304gvx0': {
      'en': 'Price decreasing',
      'fr': 'Baisse des prix',
    },
    '8rp3ewxu': {
      'en': 'Rate ascending',
      'fr': 'Taux croissant',
    },
    'twkirxpy': {
      'en': 'No Results',
      'fr': 'Aucun résultat',
    },
    'w3ieyll7': {
      'en': 'Please use another keyword',
      'fr': 'Veuillez utiliser un autre mot-clé',
    },
    'ydt0lnoo': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // MyBookingPage
  {
    'o353l6gc': {
      'en': 'My bookings',
      'fr': 'Mes réservations',
    },
    'h9wzc5tl': {
      'en': '1',
      'fr': '1',
    },
    'e3c2sphz': {
      'en': 'Ongoing',
      'fr': 'En cours',
    },
    '6eqqr87a': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'r3n3cr5e': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'vyyflur6': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    '7wmy2uki': {
      'en': 'Cancel booking',
      'fr': 'Annuler la réservation',
    },
    'cigr5b0k': {
      'en': 'View ticket',
      'fr': 'Voir le billet',
    },
    '7h991kob': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'gw5i6cm4': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'dhr3oyzp': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    'z68bdl9l': {
      'en': 'Cancel booking',
      'fr': 'Annuler la réservation',
    },
    'rduiufbf': {
      'en': 'View ticket',
      'fr': 'Voir le billet',
    },
    'wegotqou': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    '8voxodqv': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'cmhm0kt0': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    'va5lssog': {
      'en': 'Cancel booking',
      'fr': 'Annuler la réservation',
    },
    '37gkfn67': {
      'en': 'View ticket',
      'fr': 'Voir le billet',
    },
    't0xz4lkd': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'sylj1rw1': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'rsgvw25v': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    'zocckneo': {
      'en': 'Cancel booking',
      'fr': 'Annuler la réservation',
    },
    'hpp6az0z': {
      'en': 'View ticket',
      'fr': 'Voir le billet',
    },
    'ypl20a55': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'jv846m77': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'qwx4cc6i': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'aubbg9cn': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'pcrag1rt': {
      'en': 'Booking completed',
      'fr': 'Réservation terminée',
    },
    '3j73qc99': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'kbp1ghhd': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'qzkl74il': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'yba9xm0p': {
      'en': 'Booking completed',
      'fr': 'Réservation terminée',
    },
    'j44c4lzr': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'auq1it52': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'yngk8chu': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'u0elux6r': {
      'en': 'Booking completed',
      'fr': 'Réservation terminée',
    },
    'esqrwbmp': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'z19djp4e': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'k6wl6006': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'lair1l7j': {
      'en': 'Booking completed',
      'fr': 'Réservation terminée',
    },
    'x823vvbz': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    '48udlxzb': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'zps7od73': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'sijzoeha': {
      'en': 'Booking completed',
      'fr': 'Réservation terminée',
    },
    '0xy5tfw7': {
      'en': 'Canceled',
      'fr': 'Annulé',
    },
    '1qmll159': {
      'en': 'Palms Casino Resort',
      'fr': 'Palms Casino Resort',
    },
    'mmdcwd34': {
      'en': 'London, United Kingdom',
      'fr': 'Londres, Royaume-Uni',
    },
    'f8pv3xq3': {
      'en': 'Canceled & Refunded',
      'fr': 'Annulé et remboursé',
    },
    'u5zqjowi': {
      'en': 'You canceled this hotel booking',
      'fr': 'Vous avez annulé cette réservation d\'hôtel',
    },
    'c6hok43n': {
      'en': 'The Mark Hotel',
      'fr': 'L\'hôtel Mark',
    },
    'rft6xx2t': {
      'en': 'Luxemburg, Germany',
      'fr': 'Luxembourg, Allemagne',
    },
    'fh5bpzhk': {
      'en': 'Canceled & Refunded',
      'fr': 'Annulé et remboursé',
    },
    'valzhgcm': {
      'en': 'You canceled this hotel booking',
      'fr': 'Vous avez annulé cette réservation d\'hôtel',
    },
    'cxq7luvv': {
      'en': 'Palazzo Versace Dubai',
      'fr': 'Palazzo Versace Dubaï',
    },
    'slbpfe64': {
      'en': 'Dubai, United Arab Emirates',
      'fr': 'Dubaï, Émirats arabes unis',
    },
    'qm7rt8rb': {
      'en': 'Canceled & Refunded',
      'fr': 'Annulé et remboursé',
    },
    '7qnr0kcu': {
      'en': 'You canceled this hotel booking',
      'fr': 'Vous avez annulé cette réservation d\'hôtel',
    },
    '0gz2rfhx': {
      'en': 'Palazzo Versace Dubai',
      'fr': 'Palazzo Versace Dubaï',
    },
    'q0yjay4w': {
      'en': 'Dubai, United Arab Emirates',
      'fr': 'Dubaï, Émirats arabes unis',
    },
    '2dmb7ljb': {
      'en': 'Canceled & Refunded',
      'fr': 'Annulé et remboursé',
    },
    '14jwdn3l': {
      'en': 'You canceled this hotel booking',
      'fr': 'Vous avez annulé cette réservation d\'hôtel',
    },
    'yktrc6vp': {
      'en': 'Palazzo Versace Dubai',
      'fr': 'Palazzo Versace Dubaï',
    },
    '30w979ks': {
      'en': 'Dubai, United Arab Emirates',
      'fr': 'Dubaï, Émirats arabes unis',
    },
    's9suv99g': {
      'en': 'Canceled & Refunded',
      'fr': 'Annulé et remboursé',
    },
    '9t323vwq': {
      'en': 'You canceled this hotel booking',
      'fr': 'Vous avez annulé cette réservation d\'hôtel',
    },
    'qohnenho': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // RefundMethodPage
  {
    '8x3qz8gm': {
      'en': 'Cancel Booking',
      'fr': 'Annuler la réservation',
    },
    '5atlbmqq': {
      'en':
          'Please select a payment refund method (only 80% will be refunded).',
      'fr':
          'Veuillez sélectionner un mode de remboursement de paiement (seulement 80 % seront remboursés).',
    },
    'bd8vmogs': {
      'en': 'Paypal',
      'fr': 'PayPal',
    },
    '5mj78txy': {
      'en': 'Google Pay',
      'fr': 'Google Pay',
    },
    'op7iz87t': {
      'en': 'Apple Pay',
      'fr': 'Apple Pay',
    },
    'vz37q76f': {
      'en': '•••• •••• •••• 4679',
      'fr': '•••• •••• •••• 4679',
    },
    'lysy33xa': {
      'en': 'Paid: \$479.5',
      'fr': 'Payé : 479,5 \$',
    },
    '4i8m2rty': {
      'en': 'Refund: \$383.8',
      'fr': 'Remboursement : 383,8 \$',
    },
    'yl1rz478': {
      'en': 'Confirm Cancellation',
      'fr': 'Confirmer l\'annulation',
    },
    'tpgk4w4u': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // PropertyPage
  {
    'sl0qgueu': {
      'en': '96+',
      'fr': '96+',
    },
    'rpursyla': {
      'en': 'Hyatt Regency Bali',
      'fr': 'Hyatt Regency Bali',
    },
    'rf6gkz0h': {
      'en': 'Jl. Danau Tamblingan No. 89, Sanur, Denpasar',
      'fr': 'Jl. Danau Tamblingan n° 89, Sanur, Denpasar',
    },
    'okhzqds4': {
      'en': '4.8',
      'fr': '4.8',
    },
    'rjwxqioc': {
      'en': '• 374 reviews',
      'fr': '• 374 avis',
    },
    'hzy2tc4b': {
      'en': 'Property Facilities',
      'fr': 'Installations de la propriété',
    },
    'ykea5h7q': {
      'en': 'See all',
      'fr': 'Tout voir',
    },
    't8r3v7la': {
      'en': 'Wifi',
      'fr': 'Wifi',
    },
    'ji0w9pbo': {
      'en': 'Pool',
      'fr': 'Piscine',
    },
    'vmz4a2bv': {
      'en': 'Beach',
      'fr': 'Plage',
    },
    'zvqd0i7q': {
      'en': 'AC',
      'fr': 'CA',
    },
    'cjdvc4l7': {
      'en': 'Gym',
      'fr': 'Salle de sport',
    },
    'ntdm3ol5': {
      'en': 'Description',
      'fr': 'Description',
    },
    't810rnog': {
      'en':
          'Set on the old site of Bali Hyatt on the main street of Sanur, the hotel is located on a delightful beachfront with nine hectares of lush.',
      'fr':
          'Situé sur l\'ancien site du Bali Hyatt sur la rue principale de Sanur, l\'hôtel est situé sur un charmant front de mer avec neuf hectares de végétation luxuriante.',
    },
    '1dj5m8y7': {
      'en': 'Read more',
      'fr': 'En savoir plus',
    },
    '08jar096': {
      'en': 'Price',
      'fr': 'Prix',
    },
    'i1mm36cb': {
      'en': '\$56',
      'fr': '56 \$',
    },
    '9am4seic': {
      'en': '/ night',
      'fr': '/ nuit',
    },
    'd9ir5hy5': {
      'en': 'Book Now',
      'fr': 'Réservez maintenant',
    },
    'v96lhzrf': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // RatingPropertyPage
  {
    '67uhekwu': {
      'en': 'Rating',
      'fr': 'Notation',
    },
    'zy099yk4': {
      'en': 'Cleanliness',
      'fr': 'Propreté',
    },
    'wv8fkas8': {
      'en': '4.8',
      'fr': '4.8',
    },
    'mv37uzdw': {
      'en': 'Services',
      'fr': 'Services',
    },
    'dwcwqs74': {
      'en': '4.9',
      'fr': '4.9',
    },
    'zzimqmrd': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    'r725kr6s': {
      'en': '4.7',
      'fr': '4.7',
    },
    'jffib1v2': {
      'en': '4.8',
      'fr': '4.8',
    },
    'spzt0w3g': {
      'en': '374 Reviews',
      'fr': '374 avis',
    },
    '3w3o9c00': {
      'en': '5',
      'fr': '5',
    },
    'sw6enfo1': {
      'en': '4',
      'fr': '4',
    },
    'kyhccqmc': {
      'en': '3',
      'fr': '3',
    },
    'c9fgjbwl': {
      'en': '2',
      'fr': '2',
    },
    'rj2m6ko1': {
      'en': '1',
      'fr': '1',
    },
    '6ortswyt': {
      'en': 'Abraham Adam',
      'fr': 'Abraham Adam',
    },
    '7fddhkx9': {
      'en': '2 days ago',
      'fr': 'il y a 2 jours',
    },
    'gi8alx8m': {
      'en':
          'First of all, the location of this hotel is between the beach and fun street where full of shops, restaurants/bars, spas, and more.',
      'fr':
          'Tout d\'abord, l\'emplacement de cet hôtel se situe entre la plage et une rue animée où regorgent de boutiques, de restaurants/bars, de spas et bien plus encore.',
    },
    'v6cl763d': {
      'en': 'Jessica Wong',
      'fr': 'Jessica Wong',
    },
    'z3oktiw7': {
      'en': '5 days ago',
      'fr': 'il y a 5 jours',
    },
    '89bs9z5j': {
      'en':
          'Beautiful hotel which had everything you could need. Rooms were spotless and well appointed.',
      'fr':
          'Bel hôtel offrant tout le nécessaire. Les chambres étaient impeccables et bien aménagées.',
    },
    '2qh55zs3': {
      'en': 'Joe Alexander',
      'fr': 'Joe Alexander',
    },
    '0t8a0b1g': {
      'en': '1 week ago',
      'fr': 'il y a 1 semaine',
    },
    'cd3i9lfh': {
      'en': '\$56',
      'fr': '56 \$',
    },
    'c6uitoht': {
      'en': '/ night',
      'fr': '/ nuit',
    },
    '2l4c6nn9': {
      'en': 'Book Now',
      'fr': 'Réservez maintenant',
    },
    '7grkpffg': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // LocationPropertyPage
  {
    'cde5lk87': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    '01w8ig95': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    'r04jt0af': {
      'en': 'Jl. Danau Tamblingan No. 89, Sanur, Denpasar',
      'fr': 'Jl. Danau Tamblingan n° 89, Sanur, Denpasar',
    },
    'ka4o9ord': {
      'en': 'Room Type',
      'fr': 'Type de chambre',
    },
    'r341vjto': {
      'en': 'Twin View Room',
      'fr': 'Chambre Twin avec vue',
    },
    'ugfc0a9q': {
      'en': '2 Guests',
      'fr': '2 invités',
    },
    'judm1uy5': {
      'en': 'Seating Area',
      'fr': 'Coin salon',
    },
    '3o0tulud': {
      'en': 'Shower',
      'fr': 'Douche',
    },
    'o2926g7v': {
      'en': 'Air Conditioning',
      'fr': 'Climatisation',
    },
    'c4d8ls61': {
      'en': '\$56/night',
      'fr': '56 \$/nuit',
    },
    'ygq4z8mh': {
      'en': 'Suite King Bed',
      'fr': 'Suite avec lit King Size',
    },
    'ksc921qu': {
      'en': '2 Guests',
      'fr': '2 invités',
    },
    '6ro4kl6i': {
      'en': 'Dining Area',
      'fr': 'Salle à manger',
    },
    'h1wdfpwt': {
      'en': 'Bathtub',
      'fr': 'Baignoire',
    },
    'ooocsczk': {
      'en': 'Air Conditioning',
      'fr': 'Climatisation',
    },
    'gimkm83m': {
      'en': '\$64/night',
      'fr': '64 \$/nuit',
    },
    'ylc0wz8r': {
      'en': 'Twin Club Deluxe',
      'fr': 'Twin Club Deluxe',
    },
    '6uw3rasv': {
      'en': '\$56',
      'fr': '56 \$',
    },
    'bxgjp8fj': {
      'en': '/ night',
      'fr': '/ nuit',
    },
    '2m2yc24w': {
      'en': 'Book Now',
      'fr': 'Réservez maintenant',
    },
    'x1rk2ul6': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // FacilitiesPropertyPage
  {
    'psfypsfo': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    'rio7lnri': {
      'en': 'Hotel Service',
      'fr': 'Service hôtelier',
    },
    '3bld6ght': {
      'en': '•',
      'fr': '•',
    },
    '9p88xv5t': {
      'en': 'Laundry',
      'fr': 'Lessive',
    },
    'krwk6iog': {
      'en': '•',
      'fr': '•',
    },
    'c8gjrg3i': {
      'en': 'Medical Services',
      'fr': 'Services médicaux',
    },
    'evzvoc1h': {
      'en': '•',
      'fr': '•',
    },
    '15bq2i6x': {
      'en': 'Money Changer',
      'fr': 'Bureau de change',
    },
    '34iaetjs': {
      'en': '•',
      'fr': '•',
    },
    '9z1cnidc': {
      'en': 'Luggage Storage',
      'fr': 'Consigne à bagages',
    },
    'b6p8f7d1': {
      'en': '•',
      'fr': '•',
    },
    '239ln52o': {
      'en': 'Tours',
      'fr': 'Visites',
    },
    'kjrs30dz': {
      'en': '•',
      'fr': '•',
    },
    'xktq6jvn': {
      'en': 'Concierge',
      'fr': 'Concierge',
    },
    'zi7zaxx3': {
      'en': '•',
      'fr': '•',
    },
    '382r0wa2': {
      'en': '24 hour Security',
      'fr': 'Sécurité 24 heures sur 24',
    },
    'ckaopirg': {
      'en': '•',
      'fr': '•',
    },
    '6g9ba75z': {
      'en': 'Bellhop',
      'fr': 'Groom',
    },
    't6x0t1k0': {
      'en': 'Things to Do',
      'fr': 'Choses à faire',
    },
    'u8x4o2jg': {
      'en': 'Foods and Drinks',
      'fr': 'Aliments et boissons',
    },
    't9366c4y': {
      'en': 'General',
      'fr': 'Général',
    },
    'wbr7vpuh': {
      'en': 'Nearby Facilities',
      'fr': 'Installations à proximité',
    },
    'l2f07iyw': {
      'en': 'Public Facilities',
      'fr': 'Équipements publics',
    },
    'dheijb6t': {
      'en': 'Sports and Recreations',
      'fr': 'Sports et loisirs',
    },
    'qfgwhuma': {
      'en': 'Transportation',
      'fr': 'Transport',
    },
    '86ycwu0g': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // BookingPropertyPage
  {
    'tugfiwh8': {
      'en': 'Booking & Payment',
      'fr': 'Réservation et paiement',
    },
    '3usunpjr': {
      'en': '1',
      'fr': '1',
    },
    'tjgiccy2': {
      'en': 'Booking',
      'fr': 'Réservation',
    },
    '74so9fxu': {
      'en': '2',
      'fr': '2',
    },
    'qumw8kql': {
      'en': 'Info',
      'fr': 'Informations',
    },
    'jvl24hvn': {
      'en': '3',
      'fr': '3',
    },
    'huaa3f19': {
      'en': 'Payment',
      'fr': 'Paiement',
    },
    'oi6gsano': {
      'en': 'Hyatt Regency Bali',
      'fr': 'Hyatt Regency Bali',
    },
    'wmffnk3h': {
      'en': 'Denpasar, Bali',
      'fr': 'Denpasar, Bali',
    },
    'bd81jt0o': {
      'en': 'Suite King Bed',
      'fr': 'Suite avec lit King Size',
    },
    'zpvw4twg': {
      'en': '\$64/night',
      'fr': '64 \$/nuit',
    },
    'oins567w': {
      'en': '4.8',
      'fr': '4.8',
    },
    'yoy2ztnv': {
      'en': 'Date',
      'fr': 'Date',
    },
    'xt3eds78': {
      'en': 'Date',
      'fr': 'Date',
    },
    'nxgdrgw5': {
      'en': 'Guest',
      'fr': 'Invité',
    },
    '6ree3rt8': {
      'en': 'Add guest',
      'fr': 'Ajouter un invité',
    },
    '6i7ij1au': {
      'en': 'Animals',
      'fr': 'Animaux',
    },
    'k5tt077v': {
      'en': 'Dog',
      'fr': 'Chien',
    },
    'pafzkjow': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '318i85ga': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'cwm0m8vb': {
      'en': 'Dog',
      'fr': 'Chien',
    },
    'o5m1yzda': {
      'en': 'Cat',
      'fr': 'Chat',
    },
    'ctycp767': {
      'en': 'Rabbit',
      'fr': 'Lapin',
    },
    '2a43ydxz': {
      'en': 'Additional Request',
      'fr': 'Demande supplémentaire',
    },
    '0o5k4zkh': {
      'en': 'Add request',
      'fr': 'Ajouter une demande',
    },
    'sd73o01c': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    'l6gw9g8j': {
      'en': '1',
      'fr': '1',
    },
    'dpw5yazc': {
      'en': 'Booking',
      'fr': 'Réservation',
    },
    't6h88cr9': {
      'en': '2',
      'fr': '2',
    },
    'fnr18lv7': {
      'en': 'Info',
      'fr': 'Informations',
    },
    '48ogmzgz': {
      'en': '3',
      'fr': '3',
    },
    'pr572cdp': {
      'en': 'Payment',
      'fr': 'Paiement',
    },
    '36s9n5uc': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'smckq6dw': {
      'en': 'Enter your name',
      'fr': 'Entrez votre nom',
    },
    'ivsr7brs': {
      'en': 'Firstname',
      'fr': 'Prénom',
    },
    'sniqzppv': {
      'en': 'Enter your firstname',
      'fr': 'Entrez votre prénom',
    },
    '72yhfgrt': {
      'en': 'Birthday',
      'fr': 'Anniversaire',
    },
    'mhpyekgt': {
      'en': 'Enter your birthday',
      'fr': 'Entrez votre date de naissance',
    },
    'ypkyfniz': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    '6s3vih52': {
      'en': 'Enter your email',
      'fr': 'Entrez votre email',
    },
    'm3wwgwbh': {
      'en': 'Post Address',
      'fr': 'Adresse postale',
    },
    'fb78kr95': {
      'en': 'Enter your post Address',
      'fr': 'Entrez votre adresse postale',
    },
    'cf2zi02q': {
      'en': 'Phone Number',
      'fr': 'Numéro de téléphone',
    },
    'o3zrancb': {
      'en': '+1',
      'fr': '+1',
    },
    'gk0yj4u1': {
      'en': 'Enter your phone number',
      'fr': 'Entrez votre numéro de téléphone',
    },
    'lqwr3t4u': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    '3a9l0208': {
      'en': '1',
      'fr': '1',
    },
    'hi22x2vf': {
      'en': 'Booking',
      'fr': 'Réservation',
    },
    'lhawvzdy': {
      'en': '2',
      'fr': '2',
    },
    '0bedeb43': {
      'en': 'Info',
      'fr': 'Informations',
    },
    '1vjg3ja9': {
      'en': '3',
      'fr': '3',
    },
    'yvyd894l': {
      'en': 'Payment',
      'fr': 'Paiement',
    },
    'cdixkt9c': {
      'en': 'Hyatt Regency Bali',
      'fr': 'Hyatt Regency Bali',
    },
    'w0tckthj': {
      'en': 'Denpasar, Bali',
      'fr': 'Denpasar, Bali',
    },
    'wfmipro5': {
      'en': 'Suite King Bed',
      'fr': 'Suite avec lit King Size',
    },
    'tlkvddhg': {
      'en': '\$64/night',
      'fr': '64 \$/nuit',
    },
    '7bd1t6mb': {
      'en': '4.8',
      'fr': '4.8',
    },
    'ctp2pkq7': {
      'en': 'Check in',
      'fr': 'Enregistrement',
    },
    'bxa89341': {
      'en': 'Mon, 16 Sep',
      'fr': 'Lun. 16 sept.',
    },
    '3wbf3qk1': {
      'en': '14:00',
      'fr': '14h00',
    },
    'tpgjsscw': {
      'en': '2 Nights',
      'fr': '2 nuits',
    },
    '2utoktq6': {
      'en': 'Check out',
      'fr': 'Vérifier',
    },
    'wl7tohzo': {
      'en': 'Thu, 18 Sep',
      'fr': 'Jeu, 18 sept.',
    },
    '9mk81bxv': {
      'en': '12:00',
      'fr': '12h00',
    },
    '9zoxyrmm': {
      'en': 'Guests and Rooms',
      'fr': 'Invités et chambres',
    },
    '7x9csin5': {
      'en': '2 Rooms | 4 Guests',
      'fr': '2 chambres | 4 personnes',
    },
    'f5nzeiec': {
      'en': 'Guest Info',
      'fr': 'Informations pour les invités',
    },
    'yjcxz4kj': {
      'en': 'Hasna Azlya',
      'fr': 'Hasna Azlya',
    },
    'xpavqrtc': {
      'en': 'Choose payment method',
      'fr': 'Choisissez le mode de paiement',
    },
    'tmtg2tbt': {
      'en': 'Add promo',
      'fr': 'Ajouter une promotion',
    },
    'qokkynl8': {
      'en': 'Amount',
      'fr': 'Montant',
    },
    '73okkj9y': {
      'en': '\$256',
      'fr': '256 \$',
    },
    'o10uu4mf': {
      'en': 'Tax',
      'fr': 'Impôt',
    },
    'u2e7a3za': {
      'en': '\$2.56',
      'fr': '2,56 \$',
    },
    'eh5iw6t6': {
      'en': 'Total',
      'fr': 'Total',
    },
    'jm9eksnp': {
      'en': '\$258.56',
      'fr': '258,56 \$',
    },
    'awcy1ga5': {
      'en': 'Book Now',
      'fr': 'Réservez maintenant',
    },
    'eqr4al33': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // AddCardPage
  {
    'oocb21wo': {
      'en': 'Add New Card',
      'fr': 'Ajouter une nouvelle carte',
    },
    '4iegahjt': {
      'en': 'VISA',
      'fr': 'VISA',
    },
    'kcy4b4e2': {
      'en': '* * * *  * * * *  * * * *  * * * *',
      'fr': '* * * * * * * * * * * * * * * *',
    },
    '5x5zdy8n': {
      'en': '\$0.00',
      'fr': '0,00 \$',
    },
    'p2laebn0': {
      'en': 'Cardholder name',
      'fr': 'Nom du titulaire de la carte',
    },
    '3zup4r2i': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'nrrj9ohl': {
      'en': 'Expiry date',
      'fr': 'Date d\'expiration',
    },
    'idhrfref': {
      'en': 'MM/DD',
      'fr': 'MM/JJ',
    },
    'crzevuch': {
      'en': 'Cardholder Name',
      'fr': 'Nom du titulaire de la carte',
    },
    'e061xhsl': {
      'en': 'Enter your cardholder name',
      'fr': 'Entrez le nom du titulaire de votre carte',
    },
    'a2g7c8q0': {
      'en': 'Card Number',
      'fr': 'Numéro de carte',
    },
    's4a3dify': {
      'en': 'Enter your card email',
      'fr': 'Entrez l\'e-mail de votre carte',
    },
    'yevrbh61': {
      'en': 'Expiry Date',
      'fr': 'Date d\'expiration',
    },
    '38metyfy': {
      'en': 'MM/YY',
      'fr': 'MM/AA',
    },
    'u9r5g71x': {
      'en': 'CVV',
      'fr': 'CVV',
    },
    'tzxcm1w5': {
      'en': '3 digits',
      'fr': '3 chiffres',
    },
    'wfctghlg': {
      'en': 'Zip Code',
      'fr': 'Code postal',
    },
    '2fr91kvh': {
      'en': 'Enter your zip code',
      'fr': 'Entrez votre code postal',
    },
    'c4sju7eo': {
      'en': 'Save and Continue',
      'fr': 'Enregistrer et continuer',
    },
    'exqzvg5c': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // BookinPaymentResultPage
  {
    'i5jouzkw': {
      'en': 'Booking & Payment',
      'fr': 'Réservation et paiement',
    },
    'f11w6d2y': {
      'en': 'Payment Success',
      'fr': 'Paiement réussi',
    },
    'qqdv0shq': {
      'en':
          'Your hotel booking is secured and a\nconfirmation has been sent to your email.',
      'fr':
          'Votre réservation d\'hôtel est sécurisée et une confirmation vous a été envoyée par e-mail.',
    },
    'yxwpwh8x': {
      'en': 'Back to Home',
      'fr': 'Retour à l\'accueil',
    },
    'uk9690ql': {
      'en': 'E - Receipt',
      'fr': 'E - Reçu',
    },
    '12c83ir2': {
      'en': 'Payment Error',
      'fr': 'Erreur de paiement',
    },
    'wlibwg1h': {
      'en':
          'Your hotel booking is secured and a\nconfirmation has been sent to your email.',
      'fr':
          'Votre réservation d\'hôtel est sécurisée et une confirmation vous a été envoyée par e-mail.',
    },
    'wo7dlqrj': {
      'en': 'Back to Home',
      'fr': 'Retour à l\'accueil',
    },
    '4q3w29zn': {
      'en': 'Try again',
      'fr': 'Essayer à nouveau',
    },
    'li4gkkql': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // TicketPage
  {
    'aiw2d4iy': {
      'en': 'E-Receipt',
      'fr': 'Reçu électronique',
    },
    'llugz59k': {
      'en': 'Hyatt Regency Bali',
      'fr': 'Hyatt Regency Bali',
    },
    'rogh5se6': {
      'en': 'Denpasar, Bali',
      'fr': 'Denpasar, Bali',
    },
    'tmdtrm09': {
      'en': 'Suite King Bed',
      'fr': 'Suite avec lit King Size',
    },
    'ptu2993h': {
      'en': 'Check in',
      'fr': 'Enregistrement',
    },
    'tmiiztfo': {
      'en': 'Mon, 16 Sep',
      'fr': 'Lun. 16 sept.',
    },
    'ntanvayg': {
      'en': '14:00',
      'fr': '14h00',
    },
    '0vvl295e': {
      'en': '2 Nights',
      'fr': '2 nuits',
    },
    'hzscy7b2': {
      'en': 'Check out',
      'fr': 'Vérifier',
    },
    'gbz524x0': {
      'en': 'Thu, 18 Sep',
      'fr': 'Jeu, 18 sept.',
    },
    'if27492e': {
      'en': '12:00',
      'fr': '12h00',
    },
    'mwh2fwsv': {
      'en': 'Guests and Rooms',
      'fr': 'Invités et chambres',
    },
    'bopz91fx': {
      'en': '2 Rooms | 4 Guests',
      'fr': '2 chambres | 4 personnes',
    },
    'j4mdn5oj': {
      'en': 'Guest Info',
      'fr': 'Informations pour les invités',
    },
    'fetwo5xa': {
      'en': 'Hasna Azlya',
      'fr': 'Hasna Azlya',
    },
    'gqtzh3iv': {
      'en': 'Amount',
      'fr': 'Montant',
    },
    'juccez4l': {
      'en': '\$256',
      'fr': '256 \$',
    },
    'd4pptn72': {
      'en': 'Tax',
      'fr': 'Impôt',
    },
    'melw5qh3': {
      'en': '\$2.56',
      'fr': '2,56 \$',
    },
    'dyelfy5i': {
      'en': 'Discount 20%',
      'fr': 'Remise de 20%',
    },
    '3snb1jiv': {
      'en': '-\$51.7',
      'fr': '-51,7 \$',
    },
    'drikatt3': {
      'en': 'Total',
      'fr': 'Total',
    },
    'e60e3o76': {
      'en': '\$206.86',
      'fr': '206,86 \$',
    },
    'hljbu3bb': {
      'en': 'Back to Home',
      'fr': 'Retour à l\'accueil',
    },
    'uz8k746r': {
      'en': 'Download',
      'fr': 'Télécharger',
    },
    'edb18kus': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ProfilePage
  {
    'tw0yhhqo': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    'huqzpymo': {
      'en': 'Kathryn Murphy',
      'fr': 'Kathryn Murphy',
    },
    'lruxdqvm': {
      'en': 'kathrynmurphy@email.com',
      'fr': 'kathrynmurphy@email.com',
    },
    'dc9ze80x': {
      'en': 'Padang, Indonesia',
      'fr': 'Padang, Indonésie',
    },
    '0nvnjlhj': {
      'en': '+628xx xxxx xxxx',
      'fr': '+628xx xxxx xxxx',
    },
    '0md6g5qf': {
      'en': 'Points Balance',
      'fr': 'Solde de points',
    },
    'xxl0h771': {
      'en': '500 Points',
      'fr': '500 points',
    },
    'owu3qnwo': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    'lyqug4fj': {
      'en': 'Notification Settings',
      'fr': 'Paramètres de notification',
    },
    'rfxwkme5': {
      'en': 'Privacy Settings',
      'fr': 'Paramètres de confidentialité',
    },
    'ul5lf2ga': {
      'en': 'Payments',
      'fr': 'Paiements',
    },
    'yqw4t2xg': {
      'en': 'Language Preferences',
      'fr': 'Préférences linguistiques',
    },
    '40i9asnv': {
      'en': 'Conditions of use',
      'fr': 'Conditions d\'utilisation',
    },
    'j50rfsu2': {
      'en': 'Help',
      'fr': 'Aide',
    },
    'njhsr7ov': {
      'en': 'Invite',
      'fr': 'Inviter',
    },
    'cozpc92u': {
      'en': 'Log out',
      'fr': 'Se déconnecter',
    },
    'bbot8yc8': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // EditProfilePage
  {
    'zu2y8v2n': {
      'en': 'Edit Profile',
      'fr': 'Modifier le profil',
    },
    '8aroznaf': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'whpl8o5m': {
      'en': '*',
      'fr': '*',
    },
    'im4k5yvw': {
      'en': 'Enter your full name',
      'fr': 'Entrez votre nom complet',
    },
    'akhhulf3': {
      'en': 'Firstname',
      'fr': 'Prénom',
    },
    'vie9241i': {
      'en': '*',
      'fr': '*',
    },
    'az3qdl2r': {
      'en': 'Enter your full name',
      'fr': 'Entrez votre nom complet',
    },
    '6c8szgg4': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'jmkrve02': {
      'en': '*',
      'fr': '*',
    },
    'dmfyqiwm': {
      'en': 'Enter your email',
      'fr': 'Entrez votre email',
    },
    '1tcqez2w': {
      'en': 'Gender',
      'fr': 'Genre',
    },
    'ryn351xk': {
      'en': '*',
      'fr': '*',
    },
    'l0rc3vsi': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '7s2tr89h': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'ub35xexb': {
      'en': 'Man',
      'fr': 'Homme',
    },
    '6r4nrxe0': {
      'en': 'Woman',
      'fr': 'Femme',
    },
    'nrmic3qu': {
      'en': 'Other',
      'fr': 'Autre',
    },
    'jhgksqvi': {
      'en': 'Date of birth',
      'fr': 'Date de naissance',
    },
    '493slh4k': {
      'en': '*',
      'fr': '*',
    },
    'jdx4homm': {
      'en': 'Select date of birth',
      'fr': 'Sélectionnez la date de naissance',
    },
    'u4qisuer': {
      'en': 'Save Changes',
      'fr': 'Enregistrer les modifications',
    },
    'e4xw1xmz': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // NotificationsSettingPage
  {
    'c21n1zu4': {
      'en': 'Notification',
      'fr': 'Notification',
    },
    'el6phcz1': {
      'en': 'Sound',
      'fr': 'Son',
    },
    'kzxd8gbe': {
      'en': 'Vibrate',
      'fr': 'Vibrer',
    },
    '09suwc49': {
      'en': 'New tips available',
      'fr': 'Nouveaux conseils disponibles',
    },
    'kac985vz': {
      'en': 'New service available',
      'fr': 'Nouveau service disponible',
    },
    'b8s6f0ac': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SecuritySettingsPage
  {
    '2z4j3jfz': {
      'en': 'Security',
      'fr': 'Sécurité',
    },
    '0zpqx50h': {
      'en': 'Face ID',
      'fr': 'Identification faciale',
    },
    'rv1ha7az': {
      'en': 'Remember me',
      'fr': 'Souviens-toi de moi',
    },
    'tmqq2mg1': {
      'en': 'Touch ID',
      'fr': 'Touch ID',
    },
    'qropm6jx': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'y4nhr55x': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // LanguagesSettingsPage
  {
    'tg3zlfgt': {
      'en': 'Language',
      'fr': 'Langue',
    },
    '46uuvzkh': {
      'en': 'Suggested Languages',
      'fr': 'Langues suggérées',
    },
    'mexvdre5': {
      'en': 'English (UK)',
      'fr': 'Anglais (Royaume-Uni)',
    },
    '5q86jyju': {
      'en': 'English',
      'fr': 'Anglais',
    },
    'd26pcg6w': {
      'en': 'Bahasa Indonesia',
      'fr': 'indonésien',
    },
    '9ww09d2g': {
      'en': 'Other Languages',
      'fr': 'Autres langues',
    },
    'aog8ywu2': {
      'en': 'Chineses',
      'fr': 'Chinois',
    },
    'brs5br19': {
      'en': 'Croatian',
      'fr': 'croate',
    },
    '41a0c241': {
      'en': 'Czech',
      'fr': 'tchèque',
    },
    'by1ha1lv': {
      'en': 'Danish',
      'fr': 'danois',
    },
    '45byibos': {
      'en': 'Filipino',
      'fr': 'Philippin',
    },
    'pldb63ma': {
      'en': 'Finland',
      'fr': 'Finlande',
    },
    'zff8rt3c': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // PropertyCardComponent
  {
    'lfnew9as': {
      'en': 'The Dreamland by Young Villas',
      'fr': 'Le Pays des Rêves par Young Villas',
    },
    'sro0rlr6': {
      'en': 'Kuta, Denpasar, Bali',
      'fr': 'Kuta, Denpasar, Bali',
    },
    '7fde2j1r': {
      'en': '\$34/night',
      'fr': '34 \$/nuit',
    },
    '1q3tg30k': {
      'en': '4.8',
      'fr': '4.8',
    },
  },
  // SelectDateComponent
  {
    'nnflgnz7': {
      'en': 'Select Date',
      'fr': 'Sélectionnez la date',
    },
    'qvwwrjw9': {
      'en': 'September 2024',
      'fr': 'Septembre 2024',
    },
    'oebobw44': {
      'en': 'Arrived date',
      'fr': 'Date d\'arrivée',
    },
    'yrbrsue9': {
      'en': '16 Sep 2024',
      'fr': '16 septembre 2024',
    },
    'qyfrofg0': {
      'en': 'Departure date',
      'fr': 'Date de départ',
    },
    '663qcq7m': {
      'en': '20 Sep 2024',
      'fr': '20 septembre 2024',
    },
    'thu24odb': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // SelectGuestComponent
  {
    'kmhw8pj6': {
      'en': 'Select Guest',
      'fr': 'Sélectionner un invité',
    },
    '8zhrp4rt': {
      'en': 'Adults',
      'fr': 'Adultes',
    },
    'zdk9l1tl': {
      'en': 'Ages 13 or above',
      'fr': '13 ans ou plus',
    },
    'rvdb9bno': {
      'en': '2',
      'fr': '2',
    },
    'cbffr169': {
      'en': 'Children',
      'fr': 'Enfants',
    },
    'q30qa5pf': {
      'en': 'Ages 2 - 12',
      'fr': '2 à 12 ans',
    },
    'g5s4eb6l': {
      'en': '2',
      'fr': '2',
    },
    'uxmhhfpv': {
      'en': 'Infants',
      'fr': 'Nourrissons',
    },
    'kzkwuvl9': {
      'en': 'Ages under 2',
      'fr': 'Moins de 2 ans',
    },
    's1bzbgah': {
      'en': '0',
      'fr': '0',
    },
    'qwh2wh0t': {
      'en': 'Animals',
      'fr': 'Animaux',
    },
    '9fl1vq01': {
      'en': 'Dog',
      'fr': 'Chien',
    },
    'lsad28a9': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '6nku5vk6': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'a6hvwois': {
      'en': 'Dog',
      'fr': 'Chien',
    },
    'dceis4sh': {
      'en': 'Cat',
      'fr': 'Chat',
    },
    'z9o475wz': {
      'en': 'Rabbit',
      'fr': 'Lapin',
    },
    'td9po8t5': {
      'en': '0',
      'fr': '0',
    },
    'dkp3d65n': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // FiltersSearchComponent
  {
    '3ikcyuo6': {
      'en': 'Rating',
      'fr': 'Notation',
    },
    'pbhivbhj': {
      'en': '5',
      'fr': '5',
    },
    'g4fds8dm': {
      'en': '4',
      'fr': '4',
    },
    'jnqzpwjp': {
      'en': '3',
      'fr': '3',
    },
    '2mo781r8': {
      'en': '2',
      'fr': '2',
    },
    'z6mfic6k': {
      'en': '1',
      'fr': '1',
    },
    'r05ckksq': {
      'en': '5',
      'fr': '5',
    },
    'zcv9wqyt': {
      'en': 'Price',
      'fr': 'Prix',
    },
    's6abze2y': {
      'en': 'Facilities',
      'fr': 'Installations',
    },
    'n0ki0iif': {
      'en': 'Free wifi',
      'fr': 'Wifi gratuit',
    },
    '1nhnymd7': {
      'en': 'Swimming Pool',
      'fr': 'Piscine',
    },
    'kjqgovoy': {
      'en': 'Air conditioner',
      'fr': 'Climatiseur',
    },
    '1rmtrno7': {
      'en': 'Laundry',
      'fr': 'Lessive',
    },
    'va3f4sie': {
      'en': 'Television',
      'fr': 'Télévision',
    },
    'yjlg2qou': {
      'en': 'Gym center',
      'fr': 'Centre de gym',
    },
    '5oqnt81e': {
      'en': 'Water Heater',
      'fr': 'Chauffe-eau',
    },
    'wmz6o31k': {
      'en': 'Facilities',
      'fr': 'Installations',
    },
    'oj8lh3t8': {
      'en': 'Hotel',
      'fr': 'Hôtel',
    },
    'ybliy8wg': {
      'en': 'Villa',
      'fr': 'Villa',
    },
    'nmvv0l3u': {
      'en': 'Apartment',
      'fr': 'Appartement',
    },
    'ylb1cchm': {
      'en': 'Lodging',
      'fr': 'Hébergement',
    },
    'rn1nnmcc': {
      'en': 'Holiday accomodation',
      'fr': 'Hébergement de vacances',
    },
    '71wjbfgo': {
      'en': 'Camping',
      'fr': 'Camping',
    },
    'kxj2vple': {
      'en': 'Hotel',
      'fr': 'Hôtel',
    },
    'a8lkvplh': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // CancelBookingComponent
  {
    '83wt054i': {
      'en': 'Delete booking ?',
      'fr': 'Supprimer la réservation ?',
    },
    'j7dwqbmt': {
      'en': 'Are you sure you want to cancel your booking ?',
      'fr': 'Êtes-vous sûr de vouloir annuler votre réservation ?',
    },
    '8l951w4w': {
      'en':
          'Only 80% of the money you can refund from your payment according to our policy',
      'fr':
          'Seulement 80 % de l\'argent que vous pouvez rembourser à partir de votre paiement conformément à notre politique',
    },
    'hpa5k5e5': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    '2mwn8275': {
      'en': 'Yes, continue',
      'fr': 'Oui, continuez',
    },
  },
  // RefundSuccessfullComponent
  {
    's5kkyqp2': {
      'en': 'Refund Confirmed!',
      'fr': 'Remboursement confirmé !',
    },
    'pq79sv7m': {
      'en': '\$425.24',
      'fr': '425,24 \$',
    },
    'kz8m1pus': {
      'en':
          'You have successfully canceled your order. 80% funds will be retruned to your accound',
      'fr':
          'Vous avez annulé votre commande avec succès. 80% des fonds seront reversés sur votre compte',
    },
    '9fe4jibn': {
      'en': 'OK',
      'fr': 'D\'ACCORD',
    },
  },
  // FavoritsCollectionComponent
  {
    'uj40rzrh': {
      'en': 'Add to favorite collection',
      'fr': 'Ajouter à la collection de favoris',
    },
    'r07ttnvp': {
      'en': 'Favorite',
      'fr': 'Préféré',
    },
    'zda1xivg': {
      'en': '12 propertirs',
      'fr': '12 propriétés',
    },
    '9gb7x7yx': {
      'en': 'Favorite',
      'fr': 'Préféré',
    },
    'chll1v9b': {
      'en': '12 propertirs',
      'fr': '12 propriétés',
    },
    'mgcsxzef': {
      'en': 'Favorite',
      'fr': 'Préféré',
    },
    'ypwjocoh': {
      'en': '12 propertirs',
      'fr': '12 propriétés',
    },
    '289q9k6b': {
      'en': 'Favorite',
      'fr': 'Préféré',
    },
    'wmsn6eda': {
      'en': '12 propertirs',
      'fr': '12 propriétés',
    },
    'o8c7agqj': {
      'en': 'New collection',
      'fr': 'Nouvelle collection',
    },
  },
  // CreateFavoriteCollectionComponent
  {
    '31ttoz53': {
      'en': 'Create Note',
      'fr': 'Créer une note',
    },
    'o1khn15w': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'pwqvt38b': {
      'en': 'Enter your note here...',
      'fr': 'Entrez votre note ici...',
    },
    'e18qii61': {
      'en': 'Create',
      'fr': 'Créer',
    },
  },
  // SelectAdditionalRequestComponent
  {
    'lbs7lt7f': {
      'en': 'Select Guest',
      'fr': 'Sélectionner un invité',
    },
    'h7jccpf0': {
      'en': 'Smoking room',
      'fr': 'Fumoir',
    },
    'nxrbu2ju': {
      'en': 'Connecting rooms',
      'fr': 'Chambres communicantes',
    },
    'jnu750lh': {
      'en': 'High Floor',
      'fr': 'Étage élevé',
    },
    '73b6909i': {
      'en': 'Low floor',
      'fr': 'Plancher bas',
    },
    '8g3j04eg': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // PaymentComponent
  {
    'dyyoo1jm': {
      'en': 'Select Method Payment',
      'fr': 'Sélectionnez le mode de paiement',
    },
    '954h3uh8': {
      'en': 'Mastercard',
      'fr': 'MasterCard',
    },
    '3vbpt2o4': {
      'en': '•••• •••• •••• 2718',
      'fr': '•••• •••• •••• 2718',
    },
    'lzdosvnl': {
      'en': 'VISA',
      'fr': 'VISA',
    },
    'n5ac8vd4': {
      'en': '•••• •••• •••• 3579',
      'fr': '•••• •••• •••• 3579',
    },
    'b1v92tjs': {
      'en': 'Paypal',
      'fr': 'PayPal',
    },
    'o33ignkk': {
      'en': 'hasnaaz****@gmail.com',
      'fr': 'hasnaaz****@gmail.com',
    },
    '3nh7062x': {
      'en': 'Add new card',
      'fr': 'Ajouter une nouvelle carte',
    },
    'c1c2e5s8': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // LogoutComponent
  {
    '98ms366t': {
      'en': 'Are You Sure?',
      'fr': 'Es-tu sûr?',
    },
    'eu9dk1y5': {
      'en': 'Do you want to log out?',
      'fr': 'Voulez-vous vous déconnecter ?',
    },
    'ehl8bnnx': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'l8cmpqhg': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
  },
  // Miscellaneous
  {
    'd1ag8axt': {
      'en': '',
      'fr': '',
    },
    'lswhsho7': {
      'en': '',
      'fr': '',
    },
    'ajos3kj0': {
      'en': '',
      'fr': '',
    },
    '8jhk9s0n': {
      'en': '',
      'fr': '',
    },
    'up9j821l': {
      'en': '',
      'fr': '',
    },
    '66i1svcf': {
      'en': '',
      'fr': '',
    },
    'c0m62w00': {
      'en': '',
      'fr': '',
    },
    'ouio7lx8': {
      'en': '',
      'fr': '',
    },
    '6qwx89tw': {
      'en': '',
      'fr': '',
    },
    'iiyw1t89': {
      'en': '',
      'fr': '',
    },
    'vwgq6l0g': {
      'en': '',
      'fr': '',
    },
    'ybuufd7k': {
      'en': '',
      'fr': '',
    },
    'ajg6a19r': {
      'en': '',
      'fr': '',
    },
    '7qz5gc0k': {
      'en': '',
      'fr': '',
    },
    'ns74uy32': {
      'en': '',
      'fr': '',
    },
    'vis3s5x3': {
      'en': '',
      'fr': '',
    },
    'tqcaxs34': {
      'en': '',
      'fr': '',
    },
    'dn3wg7ni': {
      'en': '',
      'fr': '',
    },
    'gqv4heih': {
      'en': '',
      'fr': '',
    },
    'kus1vco2': {
      'en': '',
      'fr': '',
    },
    'ugea2fhi': {
      'en': '',
      'fr': '',
    },
    'wpu5tnl4': {
      'en': '',
      'fr': '',
    },
    'xxnro0rl': {
      'en': '',
      'fr': '',
    },
    'ltv1yv27': {
      'en': '',
      'fr': '',
    },
    '6c784d3a': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
