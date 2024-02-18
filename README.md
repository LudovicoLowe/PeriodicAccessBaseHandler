# Periodic Access Base Handler

The application offers a way for two entities that can be identified with separate blockchain addresses, to interact defining a dynamic priod of time between a condition should be met or a resource should be available.
In particular, the use case that inspired the implementation of the utility is an host needing to garant the access to his services only during the booking period.

The application uses Scaffold-ETH2 as interface, so it should be launched with the command 'yarn start' after the deployment.

The functionalities exposed with the application are ment to be further masked into a specific set of calls, depending on the case of use.

The Host is to be considered the address deploying the contract, and the only one that can modify the period, or deny at any time the access to the services.
The Guest is to be considered the address of the entity that will be able to activate the access during the defined period. This action corresponds to the 'emit' of a simple event, that can be captured by an external client.

The start and end of the period should be timestamps.
https://www.epochconverter.com/
