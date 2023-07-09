List<String> sessions = ["5 phiên", "20 Phiên", "20 Phiên trước ATC"];

List<String> floors = ["ALL", "HOSE", "HNX", "UPCOM"];

enum DataType { string, number }

const stockData = [
  {
    'code': 'ABC',
    'time': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'time': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'time': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'time': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'time': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'time': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'time': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'time': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'time': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'time': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'time': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'time': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'DGF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'LEF',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'DGL',
    'time': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
];

const headerColumns = [
  {"name": "code", "label": "Mã", "type": DataType.string},
  {"name": "time", "label": "Thời gian", "type": DataType.string},
  {"name": "volume", "label": "Khối lượng GD", "type": DataType.number},
];

const MAX_ITEMS_PER_PAGE = 10;

const MAX_PAGES_PER_ROW = 5;
