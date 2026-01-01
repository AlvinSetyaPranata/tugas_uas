import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'hello@lumi.design');
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      await AuthService().login();
      if (!mounted) return;
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Selamat datang kembali, Designer',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              'Lanjutkan progres belajarmu.\n4 sesi mentoring tersisa bulan ini.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white.withOpacity(.8),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const _LoginForm(isWide: false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    // Access the parent state's form key and controllers via a closure or pass them?
    // Since we extracted this, we need to access the controllers.
    // Easier to just keep it inline or pass arguments.
    // But passing all controllers is tedious.
    // Let's rely on finding the parent Form? No, Form is inside this.
    // The state is in _LoginScreenState.
    // We should pass the controllers and key.
    // OR: put this widget inside the file but implementation inside the State class?
    // No, cleaner to just pass what's needed or keep structure simple.
    // Re-evaluating: Just keep it inline but duplicated structure? No.
    // Let's refactor cleanly.
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.border),
      ),
      child: _LoginFormContent(isWide: isWide),
    );
  }
}

class _LoginFormContent extends StatefulWidget {
  const _LoginFormContent({required this.isWide});
  final bool isWide;

  @override
  State<_LoginFormContent> createState() => _LoginFormContentState();
}

class _LoginFormContentState extends State<_LoginFormContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'hello@lumi.design');
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      await AuthService().login();
      if (!mounted) return;
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          const SizedBox(height: 8),
          Text(
            'Akses dashboard personal Anda dan lanjutkan belajar.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 28),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.mail_outline_rounded),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Silakan masukkan email';
              return null;
            },
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Kata Sandi',
              prefixIcon: Icon(Icons.lock_outline_rounded),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.length < 6) return 'Minimal 6 karakter';
              return null;
            },
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Lupa kata sandi?'),
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            label: 'Lanjutkan',
            icon: Icons.arrow_forward_rounded,
            onPressed: _isLoading ? null : _submit,
            loading: _isLoading,
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
              child: const Text('Buat akun baru'),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Kunjungi dashboard'),
            ),
          ),
        ],
      ),
    ));
  }
}
