package user

import company.Company


class User {
    static belongsTo = [company: Company]

    String firstName
    String lastName
    String age
    String country

    Date dateCreated
    Date lastUpdated


    static mapping = {
        table "Pouzivatel"
        firstName column: "meno"
        lastName column: "prizvisko"
        age column: "vek"
        country column: "krajina"
    }

    static constraints = {
        firstName nullable: false, blank: false
        lastName nullable: false, blank: false
        age nullable: false, blank: false
        country nullable: false, blank: false
    }
}
