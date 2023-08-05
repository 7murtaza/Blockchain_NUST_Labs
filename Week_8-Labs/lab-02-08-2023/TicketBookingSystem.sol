// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;



contract  TicketBookingSystem{
    enum TicketType{
        Economy,
        Business,
        FirstClass
    }

    enum Days{
        Monday, 
        Tuesday, 
        Wednesday, 
        Thursday, 
        Friday, 
        Saturday,
        Sunday
    }
    struct Ticket{
    string passengerName;
    TicketType ticketType;
    Days day;
    bool isBooked; 
}

    Ticket[] public tickets;

    function bookTicket(string memory _passenger, Days _day, TicketType _ticketType) public{
        tickets.push(Ticket(_passenger, _ticketType, _day, false));

    } 

    function getTicketType(uint _index) public view returns (TicketType){
        return tickets[_index].ticketType;
    }
    function  getTicketDay(uint _index) public view returns (Days){
        return tickets[_index].day;
    }

    function toggleStatus(uint _index) public {
        tickets[_index].isBooked = !tickets[_index].isBooked;
    }

}