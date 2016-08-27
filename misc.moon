lapis = require "lapis"

class extends lapis.Application
    [chat: "/chat"]: =>
        @title = "Chat on Discord"
        @html ->
            h2 "My Discord Server"
            div ->
                iframe src: "https://discordapp.com/widget?id=98612945000345600&amp;theme=dark", width: 350, height: 500, allowtransparency: true, frameborder: 0
            h2 "YouTuber Gamers"
            p ->
                text "Kind of ghost town right now, but "
                em "you"
                text " can fix that."
            div ->
                iframe src: "https://discordapp.com/widget?id=98996659454775296&amp;theme=dark", width: 350, height: 500, allowtransparency: true, frameborder: 0
            h2 "Kerbal Warfare"
            p "(Will be) Used for organizing multiplayer Kerbal warfare."
            div ->
                iframe src: "https://discordapp.com/widget?id=115597534726062086&amp;theme=dark", width: 350, height: 500, allowtransparency: true, frameborder: 0

    [chat_rules: "/chat/rules"]: =>
        @title = "Guard's Discord - Rules"
        @html ->
            ol ->
                li "Do not post links to pirated software. You can discuss piracy, but do not link to illegal downloads."
                li "No constant advertising. It's fine to tell people you have a YouTube channel or are working on something, but do not mention it constantly."
                li "By default, no one can post links except in the #shitpost channel. If you build up trust, you will be allowed to post in other channels."
                li ->
                    text "The channels:"
                    ul ->
                        li "#general is for general conversation and where we most often chat."
                        li "#computers-n-code is for programming, hacking, code, other technological items or discussions."
                        li "#trusted is a private channel for people I trust."
                        li "#music is for sharing music! :D"
                        li "#concept-art is for sharing concept art."
                        li "#shitpost is for random crap..since some people want that for some reason. >.>"
                        li "#roleplay .. some of our users like to roleplay .. I made this so they'd get out of #general .."
                        li "#bot-abuse is for playing with BoomBot, developed by Lomeli. :P"
                        li "#boomtest is a testing channel for Lomeli's use on BoomBot development."
                hr! --no idea if this will be valid syntax lol
                li "More rules may be added as needed, obviously."
                li title: "If you don't like it, see http://xkcd.com/1357/", "And finally, if you are causing significant annoyance to several members, especially if they are friends of mine, I may ban you."

    [contact: "/contact"]: =>
        @title = "Contact Info"
        @html ->
            ul ->
                li ->
                    text "Email: "
                    a href: "mailto:paul.liverman.iii@gmail.com", "paul.liverman.iii@gmail.com"
                li ->
                    text "Discord (my server): "
                    a href: "https://discord.gg/DjB84MP", target: "_blank", "invite link"
                li ->
                    text "Twitter: "
                    a href: "https://twitter.com/guard13007", target: "_blank", "@Guard13007"
                li ->
                    text "Player.me: "
                    a href: "https://player.me/guard13007", target: "_blank", "Guard13007"
            p ->
                text "Do "
                em "not"
                text " send messages to my YouTube inbox."

    [faq: "/faq"]: =>
        @title = "Frequently Asked Questions"
        @html ->
            link rel: "stylesheet", href: @build_url "static/css/faq.css"

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

            a href: "#top", "top"

            a name: "youtube"
            h2 "YouTube Questions"

            dl ->
                dt -> a name: "specs", "What are your computer's specs?"
                dd -> ul ->
                    li ->
                        b "CPU"
                        text ": FX-6300 (6-core 3.5 GHz AMD)"
                    li ->
                        b "GPU"
                        text ": HD-7850 (1 GB VRAM, AMD)"
                    li ->
                        b "RAM"
                        text ": 16 GB DDR3 (1600 MHz or whatever)"
                    li ->
                        b "SSD"
                        text ": Samsung Evo 840 something (250 GB)"
                    li ->
                        b "HDD"
                        text ": WD Blue 1 TB 7200rpm 64 MB cache (x2)"
                    li ->
                        b "Other"
                        text ": "
                        a href: "https://www.amazon.com/Cables-Go-4PORT-AUTHORITY2-35555/dp/B0006U6GGQ", target: "_blank", "This"
                        text " KVM (not actually connected to main PC right now), "
                        a href: "https://www.amazon.com/Logitech-G510s-Gaming-Keyboard-Screen/dp/B00BCEK2LU", target: "_blank", "this"
                        text " keyboard, and other shit that don't matter."

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
                        text "It's not finished yet, but you can submit them "
                        a href: @url_for("ksp_submit_crafts"), "here"
                        text ". Until that's finished, I recommend uploading your craft to "
                        a href: "https://kerbalx.com/", target: "_blank", "KerbalX"
                        text " and adding it to my public hanger. The interface is pretty bad, but it looks "
                        a href: @build_url("static/img/faq/public-hanger.png"), target: "_blank", "like this"
                        text " (after clicking \"add to hanger\" and then \"add to open hanger\" from your craft's page)."
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
                    a href: @build_url("static/img/faq/exhibit-a.png"), target: "_blank", "look at the waveforms"
                    text " though, you can see it's there."

            a href: "#top", "top"

    [date: "/date"]: =>
        Crafts = require "models.Crafts"
        out = Crafts\find(id: 1).created_at
        @html ->
            p out
