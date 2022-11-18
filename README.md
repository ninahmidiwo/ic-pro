# IC Pro

# NOTE: Repo moved to: https://github.com/ic-pro/ic-pro

IC-Pro is a decentralized quiz platform encouraging people to learn about the Internet Computer in a fun yet engaging environment. The apps puts together quizes for users to test their knowledge in the various areas in the IC.

## Running the project locally

To run the project locally, use the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```
Once the job completes, the application will be available at `http://localhost:8000?canisterId={asset_canister_id}`.

Additionally, do start the development server using

```bash
npm start
```

This will start a server at `http://localhost:8080`, proxying API requests to the replica at port 8000.

## Project Architecture

## Coming Soon!!
