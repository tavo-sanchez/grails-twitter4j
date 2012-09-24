import grails.test.twitter4j.Evento
import grails.test.twitter4j.TwitterAccount

class BootStrap {

    def init = { servletContext ->
        def evento1 = new Evento(nombre: "evento de prueba 1").save(flush:true)
         def evento2 = new Evento(nombre: "evento de prueba 2").save(flush:true)

        new TwitterAccount(registro: evento1.id,
                className: evento1.class.name,
                consumerKey:"C8jUVEdFANkjj0P9VgLA",
                consumerSecret:"SDAP8yBKp6s8QS4yi7a5tjV2RNwsfeZaDX1mishUrY",
                accessToken:"73244856-lYDyVDVMT1RiFwi4GTjFSzWCCO6wjMVjCXBdPOYdX",
                accessTokenSecret:"4EzvaV5KzK84N3C5gIk37Q77kZUNevLP49uJaUWhNck",
                screenName:"rpalcolea").save(flush:true)

        new TwitterAccount(registro: evento2.id,
                className: evento2.class.name,
                consumerKey:"C8jUVEdFANkjj0P9VgLA",
                consumerSecret:"SDAP8yBKp6s8QS4yi7a5tjV2RNwsfeZaDX1mishUrY",
                accessToken:"398745490-mytgW3Vm6GdKFe0ylVTF85BDZdENiWLhZ29lmhvR",
                accessTokenSecret:"E7OTvi2dYWWbdORHmtwY1sXonjco5cPcSzVFy3TxdE",
                screenName:"siedevelop").save(flush:true)


    }
    def destroy = {
    }
}
