class Database {
  final List<Map<String, dynamic>> busInfo = [
    {
      "bus": "Surjomukhi 100",
      "startPoint": "DSC",
      "endPoint": "Tongi",
      "startTime": "06:30 AM",
      "estimatedJourneyTime": "1h",
      "fare": 25.0,
      "driver": {"name": "Abdul Karim", "phone": "+8801711000001", "age": 45}
    },
    {
      "bus": "Surjomukhi 101",
      "startPoint": "DSC",
      "endPoint": "Rajlokkhi",
      "startTime": "08:00 AM",
      "estimatedJourneyTime": "45m",
      "fare": 20.0,
      "driver": {"name": "Rahim Uddin", "phone": "+8801711000002", "age": 50}
    },
    {
      "bus": "Oporajita 102",
      "startPoint": "Tongi",
      "endPoint": "DSC",
      "startTime": "09:00 AM",
      "estimatedJourneyTime": "1h",
      "fare": 25.0,
      "driver": {"name": "Sohail Rana", "phone": "+8801711000003", "age": 42}
    },
    {
      "bus": "Oporajita 103",
      "startPoint": "Rajlokkhi",
      "endPoint": "DSC",
      "startTime": "10:30 AM",
      "estimatedJourneyTime": "45m",
      "fare": 20.0,
      "driver": {"name": "Hasan Mahmud", "phone": "+8801711000004", "age": 47}
    },
    {
      "bus": "Surjomukhi 104",
      "startPoint": "DSC",
      "endPoint": "Dhanmondi",
      "startTime": "12:00 PM",
      "estimatedJourneyTime": "1h 20m",
      "fare": 30.0,
      "driver": {"name": "Shafiqul Islam", "phone": "+8801711000005", "age": 44}
    },
    {
      "bus": "Oporajita 105",
      "startPoint": "Dhanmondi",
      "endPoint": "DSC",
      "startTime": "01:30 PM",
      "estimatedJourneyTime": "1h 20m",
      "fare": 30.0,
      "driver": {"name": "Mizanur Rahman", "phone": "+8801711000006", "age": 48}
    },
    {
      "bus": "Surjomukhi 106",
      "startPoint": "DSC",
      "endPoint": "Mirpur",
      "startTime": "03:00 PM",
      "estimatedJourneyTime": "1h",
      "fare": 28.0,
      "driver": {"name": "Kamrul Hasan", "phone": "+8801711000007", "age": 43}
    },
    {
      "bus": "Oporajita 107",
      "startPoint": "Mirpur",
      "endPoint": "DSC",
      "startTime": "04:30 PM",
      "estimatedJourneyTime": "1h",
      "fare": 28.0,
      "driver": {"name": "Faruq Ahmed", "phone": "+8801711000008", "age": 46}
    },
    {
      "bus": "Surjomukhi 108",
      "startPoint": "DSC",
      "endPoint": "Rampura",
      "startTime": "05:30 PM",
      "estimatedJourneyTime": "1h 10m",
      "fare": 27.0,
      "driver": {"name": "Jahangir Alam", "phone": "+8801711000009", "age": 49}
    },
    {
      "bus": "Oporajita 109",
      "startPoint": "Rampura",
      "endPoint": "DSC",
      "startTime": "07:00 PM",
      "estimatedJourneyTime": "1h 10m",
      "fare": 27.0,
      "driver": {"name": "Nasir Uddin", "phone": "+8801711000010", "age": 51}
    },
    {
      "bus": "Surjomukhi 110",
      "startPoint": "DSC",
      "endPoint": "Narayanganj",
      "startTime": "08:30 PM",
      "estimatedJourneyTime": "1h 30m",
      "fare": 35.0,
      "driver": {
        "name": "Alamgir Hossain",
        "phone": "+8801711000011",
        "age": 52
      }
    },
    {
      "bus": "Oporajita 111",
      "startPoint": "Narayanganj",
      "endPoint": "DSC",
      "startTime": "09:30 PM",
      "estimatedJourneyTime": "1h 30m",
      "fare": 35.0,
      "driver": {"name": "Rakib Hasan", "phone": "+8801711000012", "age": 40}
    },
    {
      "bus": "Surjomukhi 112",
      "startPoint": "DSC",
      "endPoint": "Tongi",
      "startTime": "11:00 PM",
      "estimatedJourneyTime": "1h",
      "fare": 25.0,
      "driver": {
        "name": "Shahadat Hossain",
        "phone": "+8801711000013",
        "age": 45
      }
    },
    {
      "bus": "Oporajita 113",
      "startPoint": "Tongi",
      "endPoint": "DSC",
      "startTime": "12:30 AM",
      "estimatedJourneyTime": "1h",
      "fare": 25.0,
      "driver": {"name": "Belal Ahmed", "phone": "+8801711000014", "age": 41}
    },
  ];

  final List<Map<String, dynamic>> routes = [
    {"route": "DSC to Tongi", "fare": 25.0, "estimatedJourneyTime": "1h"},
    {"route": "DSC to Rajlokkhi", "fare": 20.0, "estimatedJourneyTime": "45m"},
    {"route": "Tongi to DSC", "fare": 25.0, "estimatedJourneyTime": "1h"},
    {"route": "Rajlokkhi to DSC", "fare": 20.0, "estimatedJourneyTime": "45m"},
    {
      "route": "DSC to Dhanmondi",
      "fare": 30.0,
      "estimatedJourneyTime": "1h 20m"
    },
    {
      "route": "Dhanmondi to DSC",
      "fare": 30.0,
      "estimatedJourneyTime": "1h 20m"
    },
    {"route": "DSC to Mirpur", "fare": 28.0, "estimatedJourneyTime": "1h"},
    {"route": "Mirpur to DSC", "fare": 28.0, "estimatedJourneyTime": "1h"},
    {"route": "DSC to Rampura", "fare": 27.0, "estimatedJourneyTime": "1h 10m"},
    {"route": "Rampura to DSC", "fare": 27.0, "estimatedJourneyTime": "1h 10m"},
    {
      "route": "DSC to Narayanganj",
      "fare": 35.0,
      "estimatedJourneyTime": "1h 30m"
    },
    {
      "route": "Narayanganj to DSC",
      "fare": 35.0,
      "estimatedJourneyTime": "1h 30m"
    }
  ];

  final List<Map<String, String>> emergencyContacts = [
    {"operator": "Fire Service", "number": "199"},
    {"operator": "Police", "number": "999"},
    {"operator": "Ambulance", "number": "16263"},
    {"operator": "Traffic Control (Dhaka)", "number": "01320080011"},
    {"operator": "National Emergency Service", "number": "999"},
    {"operator": "RAB HQ", "number": "01777720029"},
    {"operator": "Medical Helpline (DGHS)", "number": "16263"},
    {"operator": "Women and Child Helpline", "number": "109"},
    {"operator": "Railway Inquiry", "number": "131"},
    {"operator": "BRTA Helpline", "number": "16565"},
  ];

  final List<Map<String, String>> lostAndFound = [
    {
      "item": "Black Umbrella",
      "location": "DSC Bus Terminal",
      "status": "lost"
    },
    {
      "item": "Samsung Phone",
      "location": "Seat 12, Surjomukhi 100",
      "status": "lost"
    },
    {"item": "Leather Wallet", "location": "Rajlokkhi Stop", "status": "found"},
    {
      "item": "Backpack (Blue, Nike)",
      "location": "Under seat, Oporajita 103",
      "status": "lost"
    },
    {
      "item": "Prescription Glasses",
      "location": "DSC Waiting Area",
      "status": "found"
    },
    {
      "item": "ID Card (NSU)",
      "location": "Surjomukhi 104, last row",
      "status": "lost"
    },
    {
      "item": "Headphones (Red JBL)",
      "location": "Dhanmondi Terminal",
      "status": "found"
    },
    {
      "item": "Laptop Bag (Dell)",
      "location": "Seat 5, Oporajita 105",
      "status": "lost"
    },
    {
      "item": "Water Bottle (Steel)",
      "location": "Mirpur Stop",
      "status": "found"
    },
    {
      "item": "Course Notebook",
      "location": "DSC to Rampura Route",
      "status": "lost"
    },
  ];

  final List<Map<String, dynamic>> transactionHistory = [
    {"amount": 50.0, "type": "credit", "date": "2025-04-01"},
    {"amount": 30.0, "type": "debit", "date": "2025-04-02"},
    {"amount": 120.0, "type": "credit", "date": "2025-04-03"},
    {"amount": 25.0, "type": "debit", "date": "2025-04-04"},
    {"amount": 75.0, "type": "credit", "date": "2025-04-05"},
    {"amount": 40.0, "type": "debit", "date": "2025-04-05"},
    {"amount": 60.0, "type": "credit", "date": "2025-04-06"},
    {"amount": 35.0, "type": "debit", "date": "2025-04-06"},
    {"amount": 100.0, "type": "credit", "date": "2025-04-07"},
    {"amount": 45.0, "type": "debit", "date": "2025-04-07"},
  ];
}
