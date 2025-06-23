import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OfferLetterController extends GetxController {
  final RxList<Employee> employees = <Employee>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isFemale = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadEmployees();
  }
  void loadEmployees() {
    // Static data - replace with API call for dynamic
    employees.value = [
      Employee(
        name: 'John Doe',
        employeeId: 'EMP001',
        dateOfJoining: '2023-01-15',
        username: 'john.doe',
        password: '••••••••',
        accountStatus: 'Active',
        profilePicture: 'assets/image/offer_image.jpg',
        isFemale: false,
      ),
      Employee(
        name: 'Jane Smith',
        employeeId: 'EMP002',
        dateOfJoining: '2023-02-20',
        username: 'jane.smith',
        password: '••••••••',
        accountStatus: 'Active',
        profilePicture: 'assets/image/offer_image.jpg',
        isFemale: false,
      ),
      Employee(
        name: 'Mike Johnson',
        employeeId: 'EMP003',
        dateOfJoining: '2023-03-10',
        username: 'mike.johnson',
        password: '••••••••',
        accountStatus: 'Inactive',
        profilePicture: 'assets/image/offer_image.jpg',
        isFemale: false,
      ),
      Employee(
        name: 'Sarah Wilson',
        employeeId: 'EMP004',
        dateOfJoining: '2023-04-05',
        username: 'sarah.wilson',
        password: '••••••••',
        accountStatus: 'Active',
        profilePicture: 'assets/image/offer_image.jpg',
        isFemale:true,
      ),
      Employee(
        name: 'David Brown',
        employeeId: 'EMP005',
        dateOfJoining: '2023-05-12',
        username: 'david.brown',
        password: '••••••••',
        accountStatus: 'Active',
        profilePicture: 'assets/image/offer_image.jpg',
        isFemale: false,
      ),
    ];
  }

  // For dynamic API integration - uncomment and replace URL
  /*
  Future<void> fetchFromAPI() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('YOUR_API_URL'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        employees.value = data.map((e) => Employee.fromJson(e)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load employees');
    } finally {
      isLoading.value = false;
    }
  }
  */

  Future<void> printOfferLetter(Employee employee) async {
    final pdf = pw.Document();
    // Load image from assets
    final Uint8List imageBytes = await rootBundle
        .load(employee.profilePicture) // example: 'assets/images/profile1.jpg'
        .then((data) => data.buffer.asUint8List());

    final pw.ImageProvider profileImage = pw.MemoryImage(imageBytes);
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Text('OFFER LETTER', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              ),
              pw.Center(
                child: pw.Image(profileImage, width: 100, height: 100), // Show image here
              ),
              pw.SizedBox(height: 20),
              pw.Text('Employee Details:', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Name: ${employee.name}'),
              pw.Text('Employee ID: ${employee.employeeId}'),
              pw.Text('Date of Joining: ${employee.dateOfJoining}'),
              pw.Text('Username: ${employee.username}'),
              pw.Text('Account Status: ${employee.accountStatus}'),
              pw.SizedBox(height: 20),
              pw.Text('This is a sample offer letter for ${employee.name}.'),
              pw.Text('Welcome to our organization!'),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
class Employee {
  final String name;
  final String employeeId;
  final String dateOfJoining;
  final String username;
  final String password;
  final String accountStatus;
  final String profilePicture;
  final bool isFemale;

  Employee(
      {
    required this.name,
    required this.employeeId,
    required this.dateOfJoining,
    required this.username,
    required this.password,
    required this.accountStatus,
    required this.profilePicture,
        required this.isFemale,

  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    name: json['name'] ?? '',
    employeeId: json['employee_id'] ?? '',
    dateOfJoining: json['date_of_joining'] ?? '',
    username: json['username'] ?? '',
    password: json['password'] ?? '',
    accountStatus: json['account_status'] ?? '',
    profilePicture: json['profile_picture'] ?? '',
    isFemale: json['is_female'] ?? false,

  );


}