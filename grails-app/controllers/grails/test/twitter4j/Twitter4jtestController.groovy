package grails.test.twitter4j

import twitter4j.Query


class Twitter4jtestController {

    def index = { redirect action: "timeline" }

    def twitter4jService

    def timeline = {
        def tipo = params.tipo ?: "home"
        def timeline
        def tipoTimeLine
        switch (tipo) {
            case "home":
                timeline = twitter4jService.getHomeTimeline()
                tipoTimeLine = "Home Time Line"
                break;
            case "user":
                timeline = twitter4jService.getUserTimeline()
                tipoTimeLine = "User Time Line"
                break;
            case "friends":
                timeline = twitter4jService.getFriendsTimeline()
                tipoTimeLine = "Friends Time Line"
                break;
            case "public":
                timeline = twitter4jService.getPublicTimeline()
                tipoTimeLine = "Public Time Line"
                break;
            case "mentions":
                timeline = twitter4jService.getMentions()
                tipoTimeLine = "Mentions Time Line"
                break;
            default:
                println "No se especificó un tipo válido"
                break;
        }


        render view: "/timeline", model: [timeline: timeline, tipoTimeLine: tipoTimeLine]
    }

    def profiles = {
        def tipo = params.tipo ?: "friends"
        def profiles
        def tipoProfiles
        switch (tipo) {
            case "friends":
                profiles = twitter4jService.getFriendsStatuses()
                tipoProfiles = "Friends"
                break
            case "followers":
                profiles = twitter4jService.getFollowersStatuses()
                tipoProfiles = "Followers"
                break
            default:
                println "No se especificó un tipo válido"
                break
        }
        render view: "/profiles", model: [profiles: profiles, tipoProfiles: tipoProfiles]
    }

    def messages = {
        def tipo = params.tipo ?: 'recibidos'
        def mensajes
        def tipoMensajes

        switch (tipo) {
            case 'recibidos':
                mensajes = twitter4jService.getDirectMessages()
                tipoMensajes = "Mensajes Directos Recibidos"
                break
            case 'enviados':
                mensajes = twitter4jService.getSentDirectMessages()
                tipoMensajes = "Mensajes Directos Enviados"
                break
            default:
                println "No se especificó un tipo válido"
                break
        }
        render view: "/mensajes", model: [mensajes: mensajes, tipoMensajes: tipoMensajes]
    }

    def sendMessage = {

        def usuario = params.usuario
        def text = params.text

        if (twitter4jService.sendDirectMessage(usuario.toString(), text.toString())) {
            redirect action: "messages", params: ['tipo': 'enviados']
        }
        else {
            println "No se pudo realizar la acción"
        }


    }

    def rtfav = {
        def tipo = params.tipo ?: 'rtbyme'
        def tweets
        def tipoRtfav

        switch (tipo) {
            case 'rtbyme':
                tweets = twitter4jService.getRetweetedByMe()
                tipoRtfav = "RTs by me"
                break
            case 'rttome':
                tweets = twitter4jService.getRetweetedToMe()
                tipoRtfav = "RTs to me"
                break
            case 'rtofme':
                tweets = twitter4jService.getRetweetsOfMe()
                tipoRtfav = "RTs of me"

                break
            case 'favorites':
                tweets = twitter4jService.getFavorites()
                tipoRtfav = "Favorites"
                break
            default:
                println "No se especificó un tipo válido"
                break
        }
        render view: "/rtfav", model: [tweets: tweets, tipoRtfav: tipoRtfav]

    }

    def search = {
        def queryparams = params.query
        def tipoTimeLine = "Búsqueda"
        Query query = new Query(queryparams.toString());
        def timeline = twitter4jService.search(query).getTweets()
        flash.message = "Search result for '${query}'"
       render view: "/timeline", model: [timeline: timeline, tipoTimeLine: tipoTimeLine]
    }

    def follow = {

        def user = params.user
        if(twitter4jService.createFriendship(user.toString())) {
            flash.message = "Ahora sigues al usuario ${user}"

        } else {
            flash.message = "No se pudo seguir a ${user}"

        }
        redirect action:profiles
    }

     def unfollow = {

        def user = params.user
        if(twitter4jService.destroyFriendship(user.toString())) {
            flash.message = "Ahora ya no sigues al usuario ${user}"

        } else {
            flash.message = "No se pudo dejar de seguir a ${user}"

        }
        redirect action:profiles
    }

}
