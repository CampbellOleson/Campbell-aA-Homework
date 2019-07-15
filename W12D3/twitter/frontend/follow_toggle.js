const APIUtil = require("./apiUtil")

class FollowToggle {
    constructor(el){
        this.el = $(el);
        this.userId = this.el.attr("data-user-id");
        this.followState = this.el.attr("data-initial-follow-state");

        this.render();
        this.handleClick();
    }

    render() {
        if (this.followState === "true" ){
            this.el.text("Unfollow!");

        } else {
            this.el.text("Follow!");
        }
    }

    handleClick () {
        this.el.on("click", (e) => {
            e.preventDefault();

            this.el.prop("disabled", true)
            setTimeout( () =>{
                this.el.prop("disabled", false)
            }, 1000);
           if (this.followState==="true"){
               console.log(this.userId)
               console.log("This1:", this);

               APIUtil.unfollowUser().call(this)
                // $.ajax({
                //     method: "DELETE",
                //     dataType: "json",
                //     url: `/users/${this.userId}/follow`,
                //     success: () => { this.followState = "false"; this.render() }
                // });
            } else {
                console.log("This:", this);
                APIUtil.followUser().call(this)
                // $.ajax({
                //     method: "POST",
                //     dataType: "json",
                //     url: `/users/${this.userId}/follow`,
                //     success: () => {this.followState = "true"; this.render() }
                // });
            }
        });           
    }
}     
    
module.exports = FollowToggle;