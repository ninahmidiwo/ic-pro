import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Time "mo:base/Time";

module {
    public type UserId = Principal;
    public type UserName = Text;

    public type User = {
        userProfile: UserProfile;
    };

    public type UserProfile = {
       id: Nat;
       userId: Principal;
	   userName: Text;
       firstName: Text;
	   lastName: Text;
	   email: Text;
       summary: Text;
       skillset: [Text];
       photo: Text;
       status: Text;
       points: Nat;
       proRank: Nat;
       createdAt: Time.Time;
       updatedAt: Time.Time;
  };

  public type UserProfileView = {
       id: Nat;
       userId: Principal;
	   userName: Text;
       firstName: Text;
	   lastName: Text;
	   email: Text;
       summary: Text;
       skillset: [Text];
       photo: Text;
       status: Text;
       points: Nat;
       proRank: Nat;
       createdAt: Time.Time;
       updatedAt: Time.Time;
  };  

    public type Error = {
        #InvalidParameter;
        #Ok;
        #UserNotFound;
        #UserExists;
    };

    public type UserError = { #UserNotFound : UserProfileView };
}
