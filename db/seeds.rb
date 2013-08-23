colors = %w"blue green orange pink purple yellow"

images = %w"bean bridge campfire centralpark dock eiffeltower fountain gazebo grandcanyon greatwall grocerystore londoneye mall mayapyramid michiganavenue niagrafalls parkgazebo pool pyramids rapids river romefountain sakura sanfrancisco sunset temple timessquare tokyo train trees"

a = <<eos
I'm so lucky to have the people in my life that I have in my life.
I feel so peaceful after I go on a long run. I'm so happy that I began taking positive steps to take care of myself.
I'm so proud of the person that my little brother is becoming. 
Just fell on some woman's lap as the bus came to a quick stop. What an awkward moment...
A little nervous about the start of a new school year but I'm so excited to start learning about something I’m somewhat good at and love. 
Locked my keys in my car, not having the best day so far, hope it changes!
It was great seeing one of my best friends this weekend, I can't wait until next month when I can see her again.
I ran for three minutes straight two times, thats like a record for me! 
This is the way I'm going to live from now on. No messing around this time, I will be healthy.
Just saw someone help an older lady with her groceries. It's nice to see that there are kind people out there.
Having a really terrible commute today, I just used this to see something pretty!
I am nervous about where the road will lead next, but Im so proud of all that I have been able to accomplish in my life thus far! Cant wait to see where I’ll be heading to next.
I had the place to myself tonight, so I celebrated by accidentally cooking a steak in the microwave.. At least no one was around to see me cry.
So tired of the people that are critiquing me lately I just wanna say I LOVE MYSELF and wouldn't change a thing about who I have become.
Never wanted to work less in my life, hoping today goes by quickly
Can’t believe I’ve been calling my coworker the wrong name for two weeks. Why couldn’t someone have told me, so embarrassing!
Can't even begin to express my frustrations with everything today, I just need to let go and relax.
First day at a new job tomorrow, hoping I feel less nervous by tomorrow
That awkward moment when my professor asks what I'm going to do with my communications degree and I respond with bartending. And I’m serious.
Been up for 10 minutes and have already been locked out of my apartment once. This is a personal best.
Putting my feet on the floor this morning felt easier than it has in a long time.
So stressed out about everything right now. I need a vacation.
Tried buying something online and it refused to go through. Checked my bank account, I’m negative money from trying so many times. ugh.
My credit card was denied at the grocery store tonight. So embarrassing and frustrating.
Lost my credit card and my shoe after last night. Definitely not feeling like going outside today.
Fell asleep in my english class today. Someone drew on my arm with sharpie and I have to work in an hour..
Sat on a wet spot on the bus today while going home. I really hope it was just water.
Spending my day driving around with the windows rolled down is exactly what I needed. 
Found out today I’m an alternate to get into the nursing program at school. Really hoping I end up getting accepted, I’ve worked so hard for this!
My glasses froze over when I went outside this morning. Winter is so not my season.
eos

words = a.split("\n")

Rails.logger.warn(words.length)

words.each do |word|
   Thought.create({
   		text: word,
   		link: "/assets/thoughts/#{images.pop}.jpg",
		color: colors[rand(colors.length)]
   	}) 
end
