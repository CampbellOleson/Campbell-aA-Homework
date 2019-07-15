const APIUtil = {
    unfollowUser: id => {
        console.log(this);
        console.log(id);
        $.ajax({
            method: "DELETE",
            dataType: "json",
            url: `/users/${this.userId}/follow`,
            success: () => { this.followState = "false"; this.render() }
        });
    },

     followUser: id => {
        console.log(id);
        console.log(this);
        $.ajax({
            method: "POST",
            dataType: "json",
            url: `/users/${this.userId}/follow`,
            success: () => { this.followState = "true"; this.render() }
        });
    }
}

module.exports = APIUtil