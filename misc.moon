lapis = require "lapis"

class extends lapis.Application
    [games: "/games"]: =>
        @title = "Guard's Games"
        @html ->
            link rel: "stylesheet", href:  "/static/css/pure-responsive-grids.css"
            link rel: "stylesheet", href:  "/static/css/itchEmbed.css"
            div class: "pure-g", ->
                div class: "pure-u-1 pure-u-xl-1-2", style: "margin-bottom: -2px;", ->
                    div class: "itchEmbed", -> -- Realms
                        iframe src: "https://itch.io/embed/163537?linkback=true", width: 552, height: 167, frameborder: 0
                    div class: "itchEmbed", -> -- 300 Words to Save Your Ship
                        iframe src: "https://itch.io/embed/46307?linkback=true", width: 552, height: 167, frameborder: 0
                    div class: "itchEmbed", -> -- FADE
                        iframe src: "https://itch.io/embed/65758?linkback=true", width: 552, height: 167, frameborder: 0
                    div class: "itchEmbed", -> -- Opcode-Powered Shuttle
                        iframe src: "https://itch.io/embed/47156?linkback=true", width: 552, height: 167, frameborder: 0
                div class: "pure-u-1 pure-u-xl-1-2", ->
                    div class: "itchEmbed", -> -- SCP Clicker
                        iframe src: "https://itch.io/embed/133080?linkback=true", width: 552, height: 167, frameborder: 0
                    div class: "itchEmbed", -> -- RGB - The Color Chooser
                        iframe src: "https://itch.io/embed/50932?linkback=true", width: 552, height: 167, frameborder: 0
                    div class: "itchEmbed", -> -- Grand Theft Papercut
                        iframe src: "https://itch.io/embed/46316?linkback=true", width: 552, height: 167, frameborder: 0
                    div class: "itchEmbed", -> -- Psychology
                        iframe src: "https://itch.io/embed/46311?linkback=true", width: 552, height: 167, frameborder: 0

    [faq: "/faq"]: =>
        @title = "Frequently Asked Questions"
        @html ->
            link rel: "stylesheet", href:  "/static/css/faq.css"

            p "I get asked some questions a lot more often than others...so here are some answers!"

            ol ->
                li -> a href: "#general", "General"
                li -> a href: "#youtube", "YouTube"

            hr!

            a name: "general"
            h2 "General Questions"

            dl ->
                dt -> a name: "contact", "How can I contact you?"
                dd ->
                    a href: @url_for("contact"), "I have contact info listed here"
                    text "."
                dt -> a name: "name", "Why is your name Guard13007?"
                dd ->
                    a href: "https://twitter.com/craigperko/status/591228538633621504", target: "_blank", "See this Twitter conversation"
                    text "."
                dt -> a name: "john", "Who the heck is John?"
                dd ->
                    a href: "https://guard13007.com/john/id/41", "This is John."

            a href: "#top", "top"

            a name: "youtube"
            h2 "YouTube Questions"

            dl ->
                dt -> a name: "specs", "What are your computer's specs?"
                dd -> ul ->
                    li ->
                        b "CPU"
                        text ": FX-8350 (8-core, 4 GHz, AMD) "
                        strike "FX-6300 (6-core, 3.5 GHz, AMD)"
                    li ->
                        b "GPU"
                        text ": GTX 1060 (6 GM VRAM :D) "
                        strike "HD-7850 (1 GB VRAM, AMD)"
                    li ->
                        b "RAM"
                        text ": 16 GB DDR3 (1600 MHz or whatever)"
                    li ->
                        b "SSD"
                        text ": Samsung Evo 840 something (250 GB)"
                    li ->
                        b "HDD"
                        text ": WD Blue 1TB, 7200rpm, 64MB cache (x2)"
                    li ->
                        b "PSU"
                        text ": Rosewill 630W (RG630-S12)"
                    li ->
                        b "MOBO"
                        text ": ASRock 970DE3/U3S3"
                    li ->
                        b "OS"
                        text ": Windows 10 / "
                        a href: "https://elementary.io", target: "_blank", "eOS Loki"
                    li ->
                        b "Mic"
                        text ": Blue Yeti ("
                        em "not"
                        text " the Pro version), "
                        a href: "https://www.amazon.com/Turtle-Beach-Universal-Amplified-Playstation-3/dp/B00E5UHSYW", target: "_blank", "this"
                        text " (not too bad), or"
                        a href: "https://www.amazon.com/gp/product/B003VANOFY", target: "_blank", "this"
                        text " (do "
                        em "not"
                        text " buy it!)"
                    li ->
                        b "Other"
                        text ": "
                        a href: "https://www.amazon.com/Cables-Go-4PORT-AUTHORITY2-35555/dp/B0006U6GGQ", target: "_blank", "This"
                        text " KVM, "
                        a href: "https://www.amazon.com/Logitech-G510s-Gaming-Keyboard-Screen/dp/B00BCEK2LU", target: "_blank", "this"
                        text " keyboard, a cheap mouse"

                dt -> a name: "ksp-next-plane-reviews", "When is the next Plane Reviews episode?"
                dd "When I have the time to make it. It takes several hours to make each one, and I don't have a solid chunk of time for that as often as I used to."

                dt -> a name: "ksp-modlist", "What KSP mods are you using?"
                dd ->
                    text "That changes often, "
                    a href: "https://gist.github.com/Guard13007/5ef8446c40d7a0f312c3", "here is a list"
                    text " of all mods I use, sorted into categories."

                dt -> a name: "ksp-submit-plane", "How do I send you a KSP plane?"
                dd ->
                    p ->
                        text "You need to upload your craft to a file sharing website (I recommend "
                        a href: "https://kerbalx.com/", target: "_blank", "KerbalX"
                        text "), and then submit at least your name/username and a link to the craft "
                        a href: @url_for("ksp_submit_crafts"), "here"
                        text ". If you register an account on my website and log into it (look at the bottom of any page), you will be able to edit your submissions."
                    p ->
                        text "You can also still use the public hanger on KerbalX. The interface is pretty bad, but it looks "
                        a href: ("/static/img/faq/public-hanger.png"), target: "_blank", "like this"
                        text " (after clicking \"add to hanger\" and then \"add to open hanger\" from your craft's page). (Note that I don't check these often, it is a better idea to submit your craft here.)"
                    p ->
                        text "Alternately, you can still send an email to "
                        a href: "mailto:GuardAlmostGames@gmail.com", "GuardAlmostGames@gmail.com"
                        text " with the following:"
                    ul ->
                        li "Download link or .craft file (preferably on KerbalX)"
                        li "List of mods used (preferably with links)"
                        li "Version of KSP it was made in"
                        li "Name to call you (or I will use whatever your email uses)"
                        li "Action groups, any other notes you want to add"

                dt -> a name: "ksp-mods-allowed", "Can I use mods / X mod on a craft I submit to you?"
                dd "As long as you tell me what mods are used, and I can get ahold of them, I don't care. The more mods you use though, the more likely I will delay your craft, as mods make it harder to make episodes."

                dt -> a name: "ksp-submit-non-planes", "Can I submit crafts that aren't planes?"
                dd "Yes."

                dt -> a name: "ksp-plane-not-reviewed", "Why haven't you reviewed my plane yet?"
                dd "I pick randomly from the planes that have been sent to me, because I receive so many, and people tend to send several designs at once. I also delay designs that I have recently covered. However, when I get a lot of a particular replica submitted, I will often do an episode of all the same replica from different people. This means it could be anywhere from immediately after to submit to .. never. I'm sorry about that, but I'm only one person with limited time."

                dt -> a name: "email", "Did you get my email? Why didn't you reply to my email?"
                dd ->
                    text "Assuming you sent it to the "
                    a href: @url_for("contact"), "right address"
                    text " ... Yes. I don't reply to plane submissions and I often don't have time to reply to other emails."

                dt -> a name: "comment", "Why didn't you reply to my comment?"
                dd "The biggest reason is probably a lack of time. It also may be because I don't think there is anything to be gained by my reply. I don't answer things that are answered in the video, can be easily Googled, or when people ask things in a rude manner (for example, in all-caps)."

                dt -> a name: "normandy", "Do you have the Normandy mod? / Can I get the Normandy mod?"
                dd ->
                    text "No. I don't have it. That video is "
                    em "years"
                    text " old."

                dt -> a name: "ksp-intro", "Why do you say \"Kerbal Space-gram\"?"
                dd ->
                    text "I say \"pro\" very quiet and fast. In combination with the bassy sound of \"pro\" and my post-processing to remove background noise (which is also bassy), this makes the \"pro\" usually inaudible. If you "
                    a href: ("/static/img/faq/exhibit-a.png"), target: "_blank", "look at the waveforms"
                    text " though, you can see it's there."

            a href: "#top", "top"
