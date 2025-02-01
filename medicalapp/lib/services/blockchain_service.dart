import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class BlockchainService {
  late Web3Client _client;
  late Credentials _credentials;

  BlockchainService() {
    _client = Web3Client("http://127.0.0.1:7545", Client());

    // Remplacez par votre clé privée
    final privateKey = "0x8712724ccad505d0dd352b9f0d6776aaac6bfb64a1e903745177c62d1d09c45d";
    _credentials = EthPrivateKey.fromHex(privateKey);
  }

  Future<DeployedContract> getContract() async {
    final contract = await rootBundle.loadString("assets/MedicalRecord.json");
    final contractJson = jsonDecode(contract);
    final abi = contractJson["abi"];
    final contractAddress = EthereumAddress.fromHex(contractJson["networks"]["5777"]["address"]);
    return DeployedContract(ContractAbi.fromJson(jsonEncode(abi), "MedicalRecord"), contractAddress);
  }

  Future<void> addRecord(String patientName, int age, String diagnosis, String treatment) async {
    final contract = await getContract();
    final function = contract.function("addRecord");
    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: [patientName, age, diagnosis, treatment],
      ),
    );
  }

  Future<List<dynamic>> getRecord(int id) async {
    final contract = await getContract();
    final function = contract.function("getRecord");
    return await _client.call(contract: contract, function: function, params: [id]);
  }
}