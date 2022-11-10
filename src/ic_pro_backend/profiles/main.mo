import Array "mo:base/Array";
import Hash "mo:base/Hash";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Trie "mo:base/Trie";
import Types "types";

actor profile {
    type User = Types.User;
    type UserProfile = Types.UserProfile;
    type UserProfileView = Types.UserProfileView;
    type Error = Types.Error;

    stable var nextUserId : Nat = 1;
    stable var users : Trie.Trie<Nat, User> = Trie.empty();

    var filterResults : [UserProfileView] = []; // Can be used to filter profiles by proRank

    public func create(u : User) : async Nat {
        let id = nextUserId;
        nextUserId += 1;

        let (user, exists) = Trie.put(users, key(id), Nat.equal, u);

        switch(exists) {
            case null {
                users := user;
            };
            case (? v) {
                return 0;
            };
        };
        return id;
    };

    public func read(id : Nat) : async ?User {
        return Trie.find(users, key(id), Nat.equal);
    };

    public func update(id : Nat, updatedUser : User) : async Bool {
        let result = Trie.find(users, key(id), Nat.equal);
        switch(result) {
            case null {
                return false;
            };
            case (? v) {
                users := Trie.replace(users, key(id), Nat.equal, ?updatedUser).0;
            };
        };
        return true;
    };

    public func delete(id : Nat) : async Bool {
        let u = Trie.find(users, key(id), Nat.equal);
        switch(u) {
            case null {
                return false;
            };
            case (? v) {
                users := Trie.replace(users, key(id), Nat.equal, null).0;
            };
        };
        return true;
    };

    public func lookup(skillset : Text) : async [UserProfileView] {
        let results = Trie.filter<Nat, User>(users, func (k, v) {
            let skillsets = v.userProfile.skillset;
            getSkillSet(skillsets, skillset) != null;
        });

        Trie.toArray<Nat, User, UserProfileView>(results, func (k, v) {
            transform(k, v.userProfile)
        });
    };

    /** PRIVATE METHODS */
    func key(x : Nat) : Trie.Key<Nat> {
        { key = x; hash = Hash.hash(x) };
    };

    func transform(k : Nat, v : UserProfile) : UserProfileView {
        {
            id = k;
            userId = v.userId;
            userName = v.userName;
            firstName = v.firstName;
            lastName = v.lastName;
            email = v.email;
            summary = v.summary;
            skillset = v.skillset;
            photo = v.photo;
            status = v.status;
            points = v.points;
            proRank = v.proRank;
            createdAt = v.createdAt;
            updatedAt = v.updatedAt;
        };
    };

    func getSkillSet(skillsets : [Text], skillset : Text) : ?Text {
        Array.find<Text>(skillsets, func x { x == skillset });
    };
}
