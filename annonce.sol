// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Annonce {
    struct Announcement {
        uint id;
        string message;
        address author;
        uint timestamp;
    }

    Announcement[] private announcements;
    uint private nextId;

    // Ajouter une annonce
    function addAnnouncement(string memory _message) public {
        announcements.push(
            Announcement({
                id: nextId,
                message: _message,
                author: msg.sender,
                timestamp: block.timestamp
            })
        );
        nextId++;
    }

    // Consulter une annonce par identifiant
    function getAnnouncement(uint _id) public view returns (
        uint id,
        string memory message,
        address author,
        uint timestamp
    ) {
        require(_id < announcements.length, "Annonce inexistante");
        Announcement memory a = announcements[_id];
        return (a.id, a.message, a.author, a.timestamp);
    }

    // Nombre total d'annonces
    function totalAnnouncements() public view returns (uint) {
        return announcements.length;
    }
}
