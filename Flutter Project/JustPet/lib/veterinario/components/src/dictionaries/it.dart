import 'package:justpet/veterinario/components/flutter_event_calendar.dart';

class It{
  static Map fullMonthNames = const {
    'it': {
      CalendarType.JALALI: [
        'Gennaio',
        'Febbraio',
        'Marzo',
        'Aprile',
        'Maggio',
        'Giugno',
        'Luglio',
        'Agosto',
        'Settembre',
        'Ottobre',
        'Novembre',
        'Dicembre'
      ],
      CalendarType.GREGORIAN: [
        'Gennaio',
        'Febbraio',
        'Marzo',
        'Aprile',
        'Maggio',
        'Giugno',
        'Luglio',
        'Agosto',
        'Settembre',
        'Ottobre',
        'Novembre',
        'Dicembre'
      ]
    }
  };
  static Map shortMonthNames = const {
    'it': {
      CalendarType.JALALI: [
        'Gen',
        'Feb',
        'Mar',
        'Apr',
        'Mar',
        'Giu',
        'Lug',
        'Ago',
        'Set',
        'Ott',
        'Nov',
        'Dic'
      ],
      CalendarType.GREGORIAN: [
        'Gen',
        'Feb',
        'Mar',
        'Apr',
        'Mar',
        'Giu',
        'Lug',
        'Ago',
        'Set',
        'Ott',
        'Nov',
        'Dic'
      ]
    }
  };

  static Map fullDayNames = const {
    'it': {
      CalendarType.JALALI: [
        'Lunedì',
        'Martedì',
        'Mercoledì',
        'Giovedì',
        'Venerdì',
        'Sabato',
        'Domenica',
      ],
      CalendarType.GREGORIAN: [
        'Lunedì',
        'Martedì',
        'Mercoledì',
        'Giovedì',
        'Venerdì',
        'Sabato',
        'Domenica'
      ]
    }
  };
  static Map shortDayNames = const {
    'it': {
      CalendarType.JALALI: ['Lun', 'Lun', 'Lun', 'Lun', 'Lun', 'Lun', 'Lun'],
      CalendarType.GREGORIAN: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom']
    }
  };
  static Map titles = const {
    'it': {
      'empty': 'Vuoto',
      'month_selector': 'Scegli un mese',
      'year_selector': 'Scegli un anno',
    }
  };

  static Map  directionIsRTL = { 'it' : false };
}