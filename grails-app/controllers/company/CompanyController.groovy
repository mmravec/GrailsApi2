package company

class CompanyController {
    ArrayList<Company> companyList = new ArrayList<Company>()

    static scope ="session"

    static defaultAction = "initialize"

    def initialize(){
        render view: "/company/company"
    }

    def save(){
        Company newCompany = new Company(nameCompany: params?.nameCompany, address: params?.address, aboutUs: params?.aboutUs)
        newCompany.save(failOnError: true)
        redirect action: "listOfCompanys"
    }

    def listOfCompanys(){
        def companys = Company.findAll()
        render view: "/viewCompanys/list", model: [companys:companys]
    }

    def registerAgain(){
        render view: "/company/company"
    }

}
