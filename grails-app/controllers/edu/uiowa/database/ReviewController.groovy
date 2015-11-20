package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_MANAGER', 'ROLE_ADMIN'])
class ReviewController {

    def index() { 

    }

    def createReview() {
		def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))
		[rooms: rooms]
    }

    def saveReview() {
    	def r = params.room.split(" ")
        def room = Resource.findById(r[r.length - 1])
        def rating = Integer.parseInt(params.rating)
        def feedback = params.feedback

        new Review(resource: room, rating: rating, feedback: feedback).save(flush: true)
        flash.message = "Review saved!"
    	redirect action: 'index'
    }

    def viewAllReviews() {
    	def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))
    	render(view: "viewAllReviews", model: [rooms: rooms])
    }

    def viewReview() {
    	def r = params.room.split(" ")
        def room = Resource.findById(r[r.length - 1])
    	def reviews = Review.findAllByResource(room)

    	render(view: "viewReview", model: [reviews: reviews])
    }

}
