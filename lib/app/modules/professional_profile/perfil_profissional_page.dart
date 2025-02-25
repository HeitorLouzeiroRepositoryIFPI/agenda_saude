import 'package:flutter/material.dart';
import 'widgets/cabecalho_perfil.dart';
import 'widgets/secao_avaliacao.dart';
import 'widgets/secao_info.dart';
import 'widgets/botao_agendar.dart';

class PerfilProfissionalPage extends StatelessWidget {
  const PerfilProfissionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CabecalhoPerfil(),
            SecaoAvaliacao(),
            SecaoInfo(
              titulo: 'Sobre',
              conteudo: 'Médico especialista em Cardiologia com mais de 10 anos de experiência...',
            ),
            SecaoInfo(
              titulo: 'Especialidades',
              conteudo: 'Cardiologia\nEletrocardiograma\nEcocardiograma',
            ),
            SecaoInfo(
              titulo: 'Localização',
              conteudo: 'Rua das Flores, 123\nCentro - Teresina, PI',
            ),
            SizedBox(height: 20),
            BotaoAgendar(),
          ],
        ),
      ),
    );
  }
}
