# Switter

## WTF?

A twitter-like application on Ruby on Rails made for the purpose of learning RoR. The application is the same as in the Michael Hartl's *Ruby on Rails Tutorial*, but made without looking in the book.

## Status

In progress.

## Roadmap

1. ~~Indexpage controller~~
	1. ~~Index page with 'Log in' and 'Sign up' buttons~~
1. User model:
	1. ~~Generate model (nickname:string, fullname:string, password_digest:string)~~
	2. ~~Customize layout~~
	3. Create controllers: ~~new~~, ~~create~~, index, show. Views:
		1. ~~New - registration form~~
		2. Index - list users
		3. Show - show user's profile (avatar, fullname, tweets, followers, followed users, follow/unfollow button)
	4. ~~Validate model~~
2. Sessions:
	1. ~~Generate sessions controller~~
	2. Make log-in and log-out pages
3. Micropost model:
	1. Generate model (post:string)
	2. Create controllers: create. Views:
		1. New - on user's profile page for current user
		2. Index - on user's profile page for current user
	3. Validate model
4. Follow/unfollow mechanism:
	1. Generate model relashionships (follower_id:integer, followed_id:integer)
	2. Make relations in User model between followers and followed users
	3. Add follow/unfollow button and make it work
5. Feed
	1. Pour together user's and its followed users microposts in a sole feed on user's profile page
6. PROFIT

## Last subheader

I like subheaders.
