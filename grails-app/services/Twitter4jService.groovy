import org.codehaus.groovy.grails.commons.ConfigurationHolder
import twitter4j.Twitter
import twitter4j.TwitterFactory
import twitter4j.conf.ConfigurationBuilder
import grails.test.twitter4j.TwitterAccount
import javax.servlet.http.HttpSession
import org.springframework.web.context.request.RequestContextHolder

class Twitter4jService {

    static transactional = false
    static scope = "singleton"

    private HttpSession getSession() {
        return RequestContextHolder.currentRequestAttributes().getSession()
    }

    @Delegate @Lazy
    Twitter twitter = connect()

    def conectar(def id) {
        //Se establece el atributo twitterAccountId en el objeto session
        session.setAttribute("twitterAccountId", id)
        //Se realiza la conexión
        connect()
    }

    def conectar() {
        connect()
    }

    def connect() {

        ConfigurationBuilder cb = new ConfigurationBuilder();
        Long twitterAccountId = session.twitterAccountId
        if (twitterAccountId) {
            def twitterAccountInstance = TwitterAccount.get(twitterAccountId)
            cb.OAuthConsumerKey = twitterAccountInstance.consumerKey.toString()
            cb.OAuthConsumerSecret = twitterAccountInstance.consumerSecret.toString()
            cb.OAuthAccessToken = twitterAccountInstance.accessToken.toString()
            cb.OAuthAccessTokenSecret = twitterAccountInstance.accessTokenSecret.toString()
        } else {
            def twitterConfiguration = getTwitterConfiguration('default')
            twitterConfiguration.each { key, value ->
                cb."$key" = value
            }
        }
        def twitterFactory = new TwitterFactory(cb.build())
        return twitterFactory.getInstance()
    }

    private getTwitterConfiguration(account) {
        def configuration = ConfigurationHolder.config.twitter."$account"
        if (!configuration) {
            throw new IllegalArgumentException("Missing 'twitter.$account' configuration in your Config.groovy file")
        }
        return configuration
    }

    def limpiarConexion() {
        if (session.twitterAccountId) {
            session.removeAttribute("twitterAccountId")
        }
        println session.twitterAccountId
        twitter.shutdown()
    }
}
