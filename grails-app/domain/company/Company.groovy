package company

import user.User


class Company {

    static hasMany = [users: User]

    String nameCompany
    String address
    String aboutUs

    Date dateCreated
    Date lastUpdated



    static mapping = {
        table "spolocnost"
        nameCompany column: "menoSpolocnosti"
        address column: "adresa"
        aboutUs column: "oNas"
        users cascade: "all-delete-orphan"
    }

    static constraints = {
        nameCompany nullable: false
        address nullable: false
        aboutUs nullable: false
    }
}
