$(function () {
    $(document).on('fos_comment_add_comment', 'form.fos_comment_comment_new_form', function (event, html) {
        var $newComment = $(html);
        var id = $newComment.attr('id');
        var threadId = $newComment.data('commentThreadId');
        $('.ly-comments-container[data-comment-thread-id=' + threadId + ']').prepend($('#' + id));
    }).on('fos_comment_add_comment', 'form.fos_comment_comment_new_form, .ly-comment-item', function (event, html) {
        var $this = $(this);
        var $count = $this.closest('[data-comment-thread-container]')
            .find('.ly-comment-count:first');
        $count.html(parseInt($count.html()) + 1);
    });
});