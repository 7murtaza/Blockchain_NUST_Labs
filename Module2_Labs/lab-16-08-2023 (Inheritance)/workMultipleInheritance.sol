// TASK
// Create three Solidity contracts: ‘WorkerRole’, ‘ClientRole’, and ‘Freelancer’, with ‘Freelancer’
// inheriting from both ‘WorkerRole’ and ‘ClientRole’.
// Incorporate necessary state variables in each contract and some functions like submitWork in
// ‘WorkerRole’ and createProject in ‘ClientRole’.
// Deploy a ‘Freelancer’ instance inheriting attributes from both roles, and demonstrate invoking
// these combined actions.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract workerRole{
    string title = "programmer";
    string name = "a";
    event log(string _title, string _name, string message);
    function submitWork() public  {
        emit log(title, name, "submitted work");
    }
}
contract clientRole{
    string clientTitle = "manager";
    string clientName = "b";

     event log2(string _clientTitle, string _clientName, string message);
    function createProject() public  {
        emit log2(clientTitle, clientName,"created a new project");
    }
}
contract Freelancer is workerRole, clientRole{
    
function print() public {
        submitWork();
        createProject();
    }
}

contract Caller{
    Freelancer f = new Freelancer();
    function print() public {
        f.print();
    }
}