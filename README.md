## Steam Project

github link : https://github.com/edwinkras/steam_db_project.git

# Project made by: Edwin

## 1. General Description

In this project, I decided to go with Steam due to my knowledge of it as I've been a user of it for years. The goal here with the database is to represent how the system works (and how different features are connected with each other, hence the relationships). The main functionalities that I’ve needed to take care of are the very fundamentals of Steam, also the main entities I’ve added: 
 
- User Account Management – Each user has an account with login details, a profile, and a wallet for purchases.

- Game Library System: Each user owns a personal game library, containing the games they have purchased or received. 

- Storefront: The store contains game listings, pricing, reviews, and category-based browsing. 

- Game Status Tracking: Users can see the current game and play mode their friends are using, including the party they are playing with. 

- Friends System: Users can add friends and communicate with them. 

- Gifting System: Users can send and receive games as gifts. 

- Shared Library (Family Sharing): Users can share their libraries with friends/family and access another user’s shared library (Steam Family Sharing). 

- Order and Payment Management: Tracks user purchases, including subtotal, taxes, and payment methods.

## 2. a) Logical Model

```plantuml
@startuml

entity UserAccount {
    * account_id : integer <<generated>> <<pk>>
    ---
    username : String
    password : String
    online_status : string
}

entity Profile {
    * uid : integer <<pk>> <<fk>>
    ---
    name : text
    friends : integer
    recent_activity : text
    games_owned : integer
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
    owner_id : integer
}

entity Order {
    * order_id : integer <<generated>> <<pk>>
    ---
    wallet_id : integer
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
UserAccount "1" -- "1" Wallet : has

UserAccount "1" -- "*" GameStatus
UserAccount "*" -- "*" Friend

Game "*" -- "1" Store
Order "*" -- "1" Store : gets from

SharedLibrary "*" -- "1" UserAccount : owned by
SharedLibrary "1" -- "1" Library : shared_library_of

Order "1" -- "*" Gift
Wallet "1" -- "*" Order : pays

Gift "*" -- "1" UserAccount : sender
Gift "*" -- "1" UserAccount : receiver


UserAccount "1" -- "1" Profile : has


@enduml

```

## b) Physical Model

```plantuml
@startuml

entity UserAccount {
    * uid : INT <<pk>> <<generated>>
    ---
    username : VARCHAR(32) NOT NULL
    password : VARCHAR(64) NOT NULL
    online_status : VARCHAR(20) NOT NULL
}

entity Profile {
    * uid : INT <<pk>> <<fk>>
    ---
    name : TEXT NOT NULL
    friends : INTEGER DEFAULT 0
    recent_activity : TEXT
    games_owned : INTEGER DEFAULT 0
}

entity Library {
    * lid : INT <<pk>> <<generated>>
    ---
    uid : INT <<fk>> NOT NULL
    games : TEXT
    games_owned : INTEGER DEFAULT 0
}

entity Game {
    * gid : INT <<pk>> <<generated>>
    ---
    name : VARCHAR(100) NOT NULL
    store_page : VARCHAR(255)
    reviews : TEXT
    friends_played : TEXT
    playtime : TIME
}

entity Store {
    * store_id : INT <<pk>> <<generated>>
    ---
    uid : INT <<fk>> NOT NULL
    gid : INT <<fk>> NOT NULL
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
    uid : INT <<fk>> NOT NULL
    balance : DECIMAL(12, 2) DEFAULT 0.00
    card_information : VARCHAR(100)
}

entity GameStatus {
    * status_id : INT <<pk>> <<generated>>
    ---
    user_id : INT <<fk>> NOT NULL
    game_id : INT <<fk>> NOT NULL
    mode_played : VARCHAR(50)
    game_party : VARCHAR(100)
}

entity Friend {
    * fid : INT <<pk>> <<generated>>
    ---
    uid : INT <<fk>> NOT NULL
    friend_user_id : INT <<fk>> NOT NULL
    chat : TEXT
    friend_request : BOOLEAN DEFAULT FALSE
}

entity SharedLibrary {
    * slid : INT <<pk>> <<generated>>
    ---
    lid : INT <<fk>> NOT NULL
    shared_library_name : VARCHAR(100)
    owner_id : INT <<fk>> NOT NULL
}

entity Order {
    * oid : INT <<pk>> <<generated>>
    ---
    wallet_id : INT <<fk>> NOT NULL
    subtotal : DECIMAL(12, 2)
    taxes : DECIMAL(12, 2)
    payment_method : VARCHAR(50)
    gift_recipient : VARCHAR(255)
    cart_amount : DECIMAL(12, 2)
}

entity Gift {
    * gift_id : INT <<pk>> <<generated>>
    ---
    game_id : INT <<fk>> NOT NULL
    sender_id : INT <<fk>> NOT NULL
    receiver_id : INT <<fk>> NOT NULL
    message : TEXT
    status : VARCHAR(50)
}

UserAccount "1" -- "1" Profile : has
UserAccount "1" -- "1" Library : owns
UserAccount "1" -- "1" Wallet : has

UserAccount "1" -- "*" GameStatus
UserAccount "*" -- "*" Friend

Game "*" -- "1" Store
Order "*" -- "1" Store : gets from

SharedLibrary "*" -- "1" UserAccount : owned by
SharedLibrary "1" -- "1" Library : shared_library_of

Order "1" -- "*" Gift
Wallet "1" -- "*" Order : pays

Gift "*" -- "1" UserAccount : sender
Gift "*" -- "1" UserAccount : receiver

@enduml

```

- For the main entities and relationships, I have structured the database around 9 core entities that support each other and reflect the essential Steam features:

- UserAccount – Represents a Steam user with login credentials and profile-related information.

- Library – Each user owns one personal game library. This entity stores game references (as text) directly within the library.

- Game – Represents individual games available on the platform.

- Store – Contains information about games available for purchase, including pricing, sales, categories, and developer details.

- Wallet – Each user has a wallet managing their balance and payment methods.

- Gift – Represents games sent as gifts from one user to another.

- GameStatus – Tracks which game a user is currently playing, including play mode and party details.

- Friend – Models friendships between users, including friend requests and chat history.

- Order – Records user purchases, linking wallets, purchased games, prices, and gift information.

- SharedLibrary – Represents a shared game library where a user can share their library with friends or family. 
- It directly links to a user account, a library, and a friend, without using a separate membership table.

 

For the relationships between the entities: 
 

- A UserAccount owns exactly one Library and one Wallet.

- Each Library contains a list of games owned by the user (stored as text), instead of being linked via a separate relationship table.

- A UserAccount can have many Friends, representing friend connections and enabling chat.

- The GameStatus tracks which game and mode a user is currently playing, linking to both user and game.

- A Game appears in the Store, where users can view pricing, sales, and category details.

- Orders are placed by users through their Wallets, recording purchase details.

- Gifts are sent and received between users, linking sender and receiver accounts with the gifted game.

- The SharedLibrary allows a user to share their Library with a friend, linking directly the library, owner user, 
- and the friend user in one entity without an additional linking table.