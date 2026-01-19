import 'package:flutter/material.dart';
import '../../models/member.dart';
import '../../services/members/member_service.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/custom_dropdown.dart';
import '../../widgets/inputs/custom_text_field.dart';

class AddMemberScreen extends StatefulWidget {
  final Member? member;

  const AddMemberScreen({super.key, this.member});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _membershipType;
  DateTime? _joinDate;

  bool _isSaving = false;
  String? _error;

  final List<String> _membershipOptions = const [
    'Basic',
    'Standard',
    'Premium',
  ];

  @override
  void initState() {
    super.initState();
    final member = widget.member;
    if (member != null) {
      _nameController.text = member.name;
      _phoneController.text = member.phone;
      _membershipType = member.membershipType.isNotEmpty
          ? member.membershipType
          : _membershipOptions.first;
      _joinDate = member.joinDate ?? member.createdAt;
    }
  }

  Future<void> _pickJoinDate() async {
    final now = DateTime.now();
    final initialDate = _joinDate ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _joinDate = picked;
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
      _error = null;
    });

    try {
      if (widget.member == null) {
        await MemberService.addMember(
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          membershipType: _membershipType ?? _membershipOptions.first,
          joinDate: _joinDate,
        );
      } else {
        await MemberService.updateMember(
          id: widget.member!.id,
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          membershipType: _membershipType ?? _membershipOptions.first,
          joinDate: _joinDate,
        );
      }
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to save member: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.member != null;
    final width = MediaQuery.of(context).size.width;
    final maxWidth = width > 600 ? 500.0 : double.infinity;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Member' : 'Add Member'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: _nameController,
                    label: 'Name',
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _phoneController,
                    label: 'Phone',
                    isNumber: true,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Phone is required' : null,
                  ),
                  const SizedBox(height: 12),
                  CustomDropdown(
                    label: 'Membership Type',
                    value: _membershipType ?? _membershipOptions.first,
                    options: _membershipOptions,
                    onChanged: (val) {
                      setState(() {
                        _membershipType = val;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _joinDate != null
                              ? 'Join date: ${_joinDate!.toLocal().toString().split(' ').first}'
                              : 'Pick join date',
                        ),
                      ),
                      TextButton(
                        onPressed: _pickJoinDate,
                        child: const Text('Select'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  PrimaryButton(
                    label: isEdit ? 'Update' : 'Save',
                    onPressed: _save,
                    isLoading: _isSaving,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
