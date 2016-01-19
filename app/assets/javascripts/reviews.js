$(document).on('ajax:success', 'form#comments-form', function(ev, data) {
	console.log(data);
	if (data.review.score === null) {
		data.review.score = 0;
	}

	var date = new Date(data.review.created_at);

	data.review.created_at = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();

	$("div.comments").append("<div class='comment'><div class='comment-header pull-left'><img class='comment-avatar' src='http://placehold.it/60x60' alt='Avatar'><div class='comment-data pull-left'><h4 class='comment-user'>" + data.user.email + "<span>" + data.review.created_at + "</span></h4><h4 class='comment-title'>" + data.review.title + "<i class='pull-right stars rate-"+ data.review.score + "'></i></h4></div></div><div class='comment-body pull-left'><p>" + data.review.body + "</p></div></div>");
	$("#review_title").val("");
	$("#review_body").val("");
	$(".msg-review-success").fadeIn('400', function() {
		$(this).delay(4000).fadeOut('400');
	});
});
$(document).on('ajax:error', 'form#comments-form', function(ev, data) {
	$(".msg-review-error").fadeIn('400', function() {
		$(this).delay(4000).fadeOut('400');
	});
	console.log(data);
});