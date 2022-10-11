import 'package:flutter/material.dart';
import 'package:flutter_cep_app/models/address_model.dart';
import 'package:flutter_cep_app/repositories/cep_repository.dart';
import 'package:flutter_cep_app/repositories/cep_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepository repository = CepRepositoryImpl();
  AddressModel? model;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar CEP'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'CEP Obrigatório';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        try {
                          final address =
                              await repository.getAddressByCep(controller.text);
                          setState(() {
                            loading = false;
                            model = address;
                          });
                        } catch (e) {
                          setState(() {
                            loading = false;
                          });
                          model = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Erro ao buscar CEP")),
                          );
                        }
                      }
                    },
                    child: const Text("Buscar")),
                Visibility(
                    visible: loading, child: const CircularProgressIndicator()),
                Visibility(
                  visible: model != null,
                  child: Text(
                    "${model?.toString()}",
                  ),
                )
              ],
            )),
      ),
    );
  }
}
