package grails.test.twitter4j

class TwitterAccount {
    Long registro
    String className
    String consumerKey
    String consumerSecret
    String accessToken
    String accessTokenSecret
    String screenName

    static constraints = {
        registro(nullable:false, blank:false)
        className(nullable:false, blank:false)
        consumerKey(nullable:false, blank:false)
        consumerSecret(nullable:false, blank:false)
        accessToken(nullable:false, blank:false)
        accessTokenSecret(nullable:false, blank:false)
        screenName(nullable:false, blank:false)

    }
}
