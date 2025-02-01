// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecord {
    struct Record {
        uint id;
        string patientName;
        uint age;
        string diagnosis;
        string treatment;
    }

    Record[] public records;
    uint public recordCount;

    function addRecord(string memory _patientName, uint _age, string memory _diagnosis, string memory _treatment) public {
        records.push(Record(recordCount, _patientName, _age, _diagnosis, _treatment));
        recordCount++;
    }

    function getRecord(uint _id) public view returns (uint, string memory, uint, string memory, string memory) {
        Record memory record = records[_id];
        return (record.id, record.patientName, record.age, record.diagnosis, record.treatment);
    }
}