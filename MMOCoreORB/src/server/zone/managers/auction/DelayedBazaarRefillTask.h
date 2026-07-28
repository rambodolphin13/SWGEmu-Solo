#ifndef DELAYEDBAZAARREFILLTASK_H_
#define DELAYEDBAZAARREFILLTASK_H_

#include "server/zone/managers/auction/AuctionManager.h"

class DelayedBazaarRefillTask : public Task {
	ManagedWeakReference<AuctionManager*> auctionManager;

public:
	DelayedBazaarRefillTask(AuctionManager* manager) {
		auctionManager = manager;
		setCustomTaskQueue("slowQueue");
	}

	void run() {
		ManagedReference<AuctionManager*> manager = auctionManager.get();

		if (manager == nullptr)
			return;

		ZoneServer* server = manager->getZoneServer();

		if (server == nullptr || server->isServerShuttingDown())
			return;

		manager->refillSimulatedBazaar(false);
	}
};

#endif
