import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../core/widgets/professional_base_screen_layout.dart';
import 'professional_profile_edit_view.dart';

class ProfessionalProfilePage extends StatelessWidget {
  const ProfessionalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfessionalBaseScreenLayout(
      currentIndex: 3,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Meu Perfil',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const ProfessionalProfileEditView(),
    );
  }
}
