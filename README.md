## Steam Project

# Project made by: Edwin

# General Description

In this project, I decided to go with Steam due to my knowledge of it as I've been a user of it for years. The goal here with the database is to represent how the system works (and how different features are connected with each other, hence the relationships). The main functionalities that I’ve needed to take care of are the very fundamentals of Steam, also the main entities I’ve added: 
 
- User Account Management – Each user has an account with login details, profile info, and a wallet for purchases. 

- Game Library System: Each user owns a personal game library, containing the games they have purchased or received. 

- Storefront: The store contains game listings, pricing, reviews, and category-based browsing. 

- Game Status Tracking: Users can see the current game and play mode their friends are using, including the party they are playing with. 

- Friends System: Users can add friends and communicate with them. 

- Gifting System: Users can send and receive games as gifts. 

- Shared Library (Family Sharing): Users can share their libraries with friends/family and access another user’s shared library (Steam Family Sharing). 

- Order and Payment Management: Tracks user purchases, including subtotal, taxes, and payment methods.

# Logical Model

```plantuml
@startuml

entity UserAccount {
    * account_id : integer <<generated>> <<pk>>
    ---
    username : String
    password : String
    profile : String
    online_status : string
}

entity Library {
    * library_id : integer <<generated>> <<pk>>
    ---
    owner_id : integer
}

entity Game {
    * game_id : integer <<generated>> <<pk>>
    ---
    name : String
    store_page : link
    reviews : String
    friends_played : images
    playtime : time
}

entity LibraryGame {
  * lg_id : integer <<generated>> <<pk>>
  ---
  library_id : integer
  game_id : integer
}

entity Store {
    * store_id : integer <<generated>> <<pk>>
    ---
    categories : type {RPG, FPS, Fighting Games, Action, Platformer}
    prices : integer
    sales : integer
    license_key : integer
    game_page : information
    wishlist : String
}

entity Wallet {
    * wallet_id : integer <<generated>> <<pk>>
    ---
    balance : integer
    card_information : String
}

entity GameStatus {
    * status_id : integer <<generated>> <<pk>>
    ---
    user_id : integer
    game_id : integer
    mode_played : String
    game_party : String
}

entity Friend {
    * friend_id : integer <<generated>> <<pk>>
    ---
    user_id : integer
    friend_user_id : integer
    chat : String
}

entity SharedLibrary {
    * share_id : integer <<generated>> <<pk>>
    ---
    library_id : integer
    shared_library_name : String
}

entity SharedLibraryMember {
  * member_id : integer <<generated>> <<pk>>
  ---
  share_id : integer
  user_id : integer
}

entity Order {
    * order_id : integer <<generated>> <<pk>>
    ---
    subtotal : integer
    taxes : integer
    payment_method : String
    gift_recipient : String
}

entity Gift {
    * gift_id : integer <<generated>> <<pk>>
    ---
    game_id : integer
    sender_id : integer
    receiver_id : integer
    message : String
    status : String
}


UserAccount "1" -- "1" Library : owns
LibraryGame "*" -- "1" Game
Library "1" -- "*" LibraryGame

UserAccount "1" -- "1" Wallet : has

Order "1" -- "0..*" Gift
Wallet "1" -- "*" Order : pays

UserAccount "1" -- "*" GameStatus
UserAccount "*" -- "*" Friend

Game "*" -- "1" Store
Order "*" -- "1" Store : gets from

SharedLibraryMember "0..1" -- "1" UserAccount : member
SharedLibrary "*" -- "1" UserAccount : owned by

SharedLibrary "1" -- "*" SharedLibraryMember : includes
SharedLibrary "1" -- "1" Library : shared_library_of

Gift "*" -- "1" UserAccount : sender
Gift "*" -- "1" UserAccount : receiver

@enduml
```

# Physical Model

```plantuml
@startuml

entity UserAccount {
    * account_id : INT <<pk>> <<generated>>
    ---
    username : VARCHAR(32) NOT NULL
    login_name : VARCHAR(32) NOT NULL UNIQUE
    password : VARCHAR(64) NOT NULL
    bio : TEXT
    friends : TEXT
    badge_collector : INT DEFAULT 0
    showcase : INT DEFAULT 0
    recent_activity : VARCHAR(255) UNIQUE
    comments : TEXT
    online_status : VARCHAR(20) NOT NULL
}

entity Library {
    * library_id : INT <<pk>> <<generated>>
    ---
    owner_id : INT <<fk>>
}

entity Game {
    * game_id : INT <<pk>> <<generated>>
    ---
    name : VARCHAR(100) NOT NULL
    store_page : VARCHAR(255)
    reviews : TEXT
    friends_played : TEXT
    playtime : TIME
}

entity LibraryGame {
    * lg_id : INT <<pk>> <<generated>>
    ---
    library_id : INT <<fk>>
    game_id : INT <<fk>>
}

entity Store {
    * store_id : INT <<pk>> <<generated>>
    ---
    categories : VARCHAR(50)
    price : DECIMAL(10, 2)
    sales : VARCHAR(2)
    license_key : VARCHAR(50)
    game_page : TEXT
    wishlist : TEXT
    free : BOOLEAN DEFAULT FALSE
}

entity Wallet {
    * wallet_id : INT <<pk>> <<generated>>
    ---
    account_id : INT <<fk>>
    balance : DECIMAL(12, 2) DEFAULT 0.00
    card_information : VARCHAR(100)
}

entity GameStatus {
    * status_id : INT <<pk>> <<generated>>
    ---
    user_id : INT <<fk>>
    game_id : INT <<fk>>
    mode_played : VARCHAR(50)
    game_party : VARCHAR(100)
}

entity Friend {
    * friend_id : INT <<pk>> <<generated>>
    ---
    user_id : INT <<fk>>
    friend_user_id : INT <<fk>>
    chat : TEXT
    friend_request : BOOLEAN DEFAULT FALSE
}

entity SharedLibrary {
    * share_id : INT <<pk>> <<generated>>
    ---
    library_id : INT <<fk>>
    shared_library_name : VARCHAR(100)
    owner_id : INT <<fk>>
}

entity SharedLibraryMember {
    * member_id : INT <<pk>> <<generated>>
    ---
    share_id : INT <<fk>>
    user_id : INT <<fk>>
}

entity Order {
    * order_id : INT <<pk>> <<generated>>
    ---
    wallet_id : INT <<fk>>
    subtotal : DECIMAL(12, 2)
    taxes : DECIMAL(12, 2)
    payment_method : VARCHAR(50)
    gift_recipient : VARCHAR(255) UNIQUE
    cart_amount : DECIMAL(12, 2)
}

entity Gift {
    * gift_id : INT <<pk>> <<generated>>
    ---
    game_id : INT <<fk>>
    sender_id : INT <<fk>>
    receiver_id : INT <<fk>>
    message : TEXT
    status : VARCHAR(50)
}

UserAccount "1" -- "1" Library : owns
UserAccount "1" -- "1" Wallet : has

LibraryGame "*" -- "1" Game
Library "1" -- "*" LibraryGame

Order "1" -- "0..*" Gift
Wallet "1" -- "*" Order : pays

UserAccount "1" -- "*" GameStatus
UserAccount "*" -- "*" Friend

Game "*" -- "1" Store
Order "*" -- "1" Store : gets from

SharedLibraryMember "*" -- "1" UserAccount : member
SharedLibrary "*" -- "1" UserAccount : owned by

SharedLibrary "1" -- "*" SharedLibraryMember : includes
SharedLibrary "1" -- "1" Library : shared_library_of

Gift "*" -- "1" UserAccount : sender
Gift "*" -- "1" UserAccount : receiver

@enduml
```

For the main entities and relationships, I’ve made 11 (9 if we're not counting relationship tables) that connect each other in different ways but support each other in the long run:  

1. UserAccount – Represents a Steam user. 

2. Library – Each user owns one library that holds their games. 

3. Game – Represents individual games on the platform. 

4. Store – Contains information like pricing, sales, and game categories. 

5. Wallet – Each user has a wallet to manage their balance and payment methods. 

6. Gift – Represents games sent from one user to another. 

7. GameStatus – Tracks what game and mode a user is currently playing. 

8. Friend – Represents the friend connections between users. 

9. Order – Represents game purchases by the user. 

10. SharedLibrary – Represents a shared game library a user can create. 

11. SharedLibraryMember – Links users to shared libraries they are part of. 

For the relationship tables, I introduced two of them that support the system: 

- LibraryGame – Connects Library and Game, allowing users to own multiple games and each game to exist in multiple libraries. 

- SharedLibraryMember – Connects SharedLibrary and UserAccount, modeling the Steam Family Sharing system. 

 

For the relationships between the entities: 
 

- A UserAccount is linked to one Library, one Wallet, many Friends, and can send and receive many Gifts. 

- A Library connects to multiple Games through LibraryGame. 

- A Game appears in the Store, and is linked to one or more Categories. 

- A UserAccount can be a member of only one SharedLibrary at a time, matching Steam’s restriction. 

- An Order is paid for using a Wallet and gets products (games) from the Store. 

- The GameStatus tracks what game a user is currently playing and with whom. 