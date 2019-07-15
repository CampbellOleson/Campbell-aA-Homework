const  FollowToggle = require("./follow_toggle");

$(() => {
    const $buttons = $(".follow-toggle");
    $buttons.each( (ind , el) => {
    const follow = new FollowToggle(el);
    // console.log(follow);
    })
});