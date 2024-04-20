import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/hotel_booking_viewmodel.dart';
import 'package:hotel_app/feature/booking/widget/room_and_guests.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/app_checkbox.dart';
import 'package:hotel_app/widget/app_date_range_picker.dart';
import 'package:hotel_app/widget/common_widget.dart';
import 'package:hotel_app/widget/date_time_utils.dart';
import 'package:hotel_app/widget/drop_down_selector.dart';
import 'package:hotel_app/widget/input_field.dart';
import 'package:provider/provider.dart';

class HotelBookingPage extends StatefulWidget {
  const HotelBookingPage({super.key});

  @override
  State<HotelBookingPage> createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  late HotelBookingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HotelBookingViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var child = Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _renderMainContent(context)),
    );

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: child,
    );
  }

  Widget _renderMainContent(BuildContext context) {
    return Consumer<HotelBookingViewModel>(
        builder: (context, value, child) => Stack(
              children: [_renderRootWidget(), _renderContinueButton(context)],
            ));
  }

  Widget _renderContinueButton(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 24,
      right: 24,
      child: appRoundedButton(context, onPressed: () => {}, title: 'Continues'),
    );
  }

  Column _renderRootWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [_renderToolbar(), _renderInputsForm()],
    );
  }

  Widget _renderInputsForm() {
    return Expanded(
      child: _renderScrollableContent(),
    );
  }

  Widget _renderScrollableContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _renderSelectDate(),
            space(height: 12),
            _renderSelectGuests(),
            space(height: 12),
            _renderSelectRoomType(),
            space(height: 12),
            _renderInputPhoneNumber(),
            space(height: 12),
            AppCheckBox(
              onChanged: (value) => {},
              title: 'Keep me update on more hotel and new from this apps.',
            ),
            space(height: 12),
            AppCheckBox(
              onChanged: (value) => {},
              title: 'Send me emials about the best hotels nearby or discount',
            ),
            space(height: 12),
            AppCheckBox(
              onChanged: (value) => {},
              customChild: _renderTextTermAndCondition(),
            ),
            space(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _renderTextTermAndCondition() {
    const textStyle = TextStyle(fontSize: 14, color: Colors.black, height: 1.4);
    const textBold = TextStyle(fontWeight: FontWeight.w600);

    var textTerm = const TextSpan(
        text: 'Apps Terms of serice, Community Guideline,', style: textBold);
    var textPrivacy = const TextSpan(text: 'Privacy Policy', style: textBold);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: RichText(
          text: TextSpan(style: textStyle, children: [
        const TextSpan(text: 'I accept the '),
        textTerm,
        const TextSpan(text: ' and '),
        textPrivacy
      ])),
    );
  }

  Widget _renderSelectDate() {
    return DropDownSelector(
        leadingIcon:
            const Icon(Icons.calendar_month_outlined, color: Colors.grey),
        label: 'Dates',
        value: viewModel.dateRange.value?.formatToString(),
        onPressed: () => _showDateRangePicker(),
        placeholder: 'Select date');
  }

  Widget _renderSelectGuests() {
    return DropDownSelector(
      leadingIcon:
          const Icon(Icons.person_outline_outlined, color: Colors.grey),
      label: 'Guests',
      onPressed: () => _editRoomAndGuest(),
      placeholder: 'Select number of guest',
    );
  }

  Widget _renderSelectRoomType() {
    return DropDownSelector(
      leadingIcon: const Icon(Icons.home_work_outlined, color: Colors.grey),
      label: 'Room Type',
      onPressed: () => {},
      placeholder: 'Select room type',
    );
  }

  Widget _renderInputPhoneNumber() {
    return AppInputField(
      placeholder: 'Your phone number',
      borderRounded: 20,
      hint: 'Phon Number',
      keyboardType: TextInputType.number,
      backgroundColorOnEmptyness: Colors.grey.withOpacity(0.04),
      hintStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      placeholderStyle: const TextStyle(fontSize: 14),
      icon: const Padding(
        padding: EdgeInsets.only(left: 20, right: 14),
        child: Icon(
          Icons.phone_outlined,
          color: Colors.grey,
        ),
      ),
      errorMessage: viewModel.phoneNumber.errorMessage,
      onChanged: (value) => viewModel.setPhoneNumber(value),
    );
  }

  Widget _renderToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back),
          const Text(
            'Form detail',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          space(width: 24)
        ],
      ),
    );
  }

  Future<void> _showDateRangePicker() async {
    final initialDate = DateTime.now();
    final firstDate = initialDate;
    final lastDate = DateTime(initialDate.year + 1);

    var maxWidth = MediaQuery.of(context).size.width * 1;
    final pickedDateRange = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: maxWidth,
            child: AppDateRangePicker(
              firstDate: firstDate,
              lastDate: lastDate,
              initialDateSelected: viewModel.dateRange.value,
            ),
          ),
        );
      },
    );

    // Handle pickedDateRange here
    if (pickedDateRange != null && pickedDateRange is DateTimeRange) {
      viewModel.setBookingDates(pickedDateRange);
    }
  }

  Future<void> _editRoomAndGuest() async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => RoomAndGuestController());
  }
}
