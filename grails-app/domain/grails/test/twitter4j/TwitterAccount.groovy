package grails.test.twitter4j

class TwitterAccount {
    Long registro
    String className
    String OAuthConsumerKey
    String OAuthConsumerSecret
    String OAuthAccessToken
    String OAuthAccessTokenSecret
    String screenName

    static constraints = {
        registro(nullable:false, blank:false)
        className(nullable:false, blank:false)
        OAuthConsumerKey(nullable:false, blank:false)
        OAuthConsumerSecret(nullable:false, blank:false)
        OAuthAccessToken(nullable:false, blank:false)
        OAuthAccessTokenSecret(nullable:false, blank:false)
        screenName(nullable:false, blank:false)

    }
}
