import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:http/http.dart' as http;

class WcomingSoonWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Email variable to store entered email
    String email = '';

    // Function to submit email to Google Form
    void _submitEmail(String email) async {
      final Uri uri = Uri.parse('https://forms.gle/8CCTofgxR9iJqMf6A');
      final response = await http.post(
        uri,
        body: {'entry.YOUR_EMAIL_FIELD_ID': email},
      );

      if (response.statusCode == 200) {
        print('Email submitted successfully!');
      } else {
        print('Failed to submit email.');
      }
    }

    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine text sizes and padding based on screen width
    final bool isMobile = screenWidth < 600;
    final double titleFontSize = isMobile ? 32 : 56;
    final double subtitleFontSize = isMobile ? 24 : 44;
    final double descriptionFontSize = isMobile ? 14 : 18;
    final double paddingHorizontal = isMobile ? 16 : 64;
    final double paddingVertical = isMobile ? 20 : 40;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF000000),
          image: DecorationImage(
            image: AssetImage('assets/12.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Elevate Your Digital Presence with ',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: titleFontSize,
                      height: 1.2,
                      color: Color(0xFFFFFFFF),
                    ),
                    children: [
                      TextSpan(
                        text: 'Portfolix.tech',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: titleFontSize,
                          height: 1.3,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'We are launching Soon!',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: subtitleFontSize,
                    height: 1.2,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CountdownTimer(
                      endTime: DateTime.now().millisecondsSinceEpoch + Duration(days: 35).inMilliseconds,
                      widgetBuilder: (context, time) {
                        int days = time?.days ?? 0;
                        int hours = time?.hours ?? 0;
                        int minutes = time?.min ?? 0;
                        int seconds = time?.sec ?? 0;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildTimeUnit(days, 'days'),
                            SizedBox(width: 10),
                            _buildTimeUnit(hours, 'hours'),
                            SizedBox(width: 10),
                            _buildTimeUnit(minutes, 'minutes'),
                            SizedBox(width: 10),
                            _buildTimeUnit(seconds, 'seconds'),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: 'Tired of the same old digital experience? At',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: descriptionFontSize,
                      height: 1.5,
                      color: Color(0xFFFFFFFF),
                    ),
                    children: [
                      TextSpan(
                        text: ' Portfolix.tech',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: descriptionFontSize,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: ', we\'re revolutionizing the way businesses come to life online. ',
                      ),
                      TextSpan(
                        text: 'We combine award-winning design and development expertise with the unrelenting energy and fresh ideas of our team to create digital solutions that captivate, engage, and propel you forward.',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: descriptionFontSize,
                          height: 1.5,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF000000)),
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFFFFF),
                        ),
                        padding: EdgeInsets.all(2),
                        child: TextField(
                          onChanged: (value) {
                            email = value; // Update email value
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.5,
                              color: Color(0xFF505050),
                            ),
                            border: InputBorder.none,
                          ),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.5,
                            color: Color(0xFF505050),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
  onPressed: () {
    _submitEmail(email); // Call the submit function
  },
  child: Text(
    'Notify Us',
    style: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      color: Color(0xFFF7F7F7),
    ),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF676767), // Set the background color here
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
),


                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Be in the know! Enter your email for launch updates and early access to our services.',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.5,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Spacer(), // Pushes the following content to the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Powered by',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(width: 12,
                    height: 30,), // Space between text and image
                    Container(
                      width: 155,
                      height: 73,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Frame.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeUnit(dynamic value, String unit) {
  return Row(
    children: [
      Text(
        value.toString(),
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 1.4,
          color: Color(0xFFFFFFFF),
        ),
      ),
      SizedBox(width: 8.5),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          unit,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1.5,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    ],
  );
}
}
