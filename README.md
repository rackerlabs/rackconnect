# Rackconnect

RackConnect provides an isolated path for network traffic to traverse between your cloud and dedicated environments located within the same region. To accomplish this, RackConnect relies on Rackspace Cloud Networks on the cloud side and dedicated network devices on the dedicated side of your environment.

Rackspace is introducing RackConnect v3.0, the latest release of our innovative hybrid connectivity offering that enables you to select and combine the best features of our dedicated and cloud hosting offerings into one all-encompassing solution. With version 3.0, you can design your computing environment to take advantage of the latest benefits in cloud computing—flexibility, scalability, elasticity—along with the benefits of traditional dedicated hosting—enhanced security and performance characteristics. RackConnect is compatible with our dedicated Managed and Intensive service levels and our cloud Managed Operations and Managed Infrastructure service levels, giving you the ability to select the level of Fanatical Support® that you need to properly manage your hybrid environment.

## Basic Usage
Rackconnect follows an ActiveModel-esque pattern that most rubyists will feel familiar with:

	Rackconnect::Auth.new({
		api_key: "",
		username: ""
	})

	# Get an array of your CloudNetworks
	networks = Rackconnect::CloudNetworks.all

	network = Rackconnect::CloudNetwork.find(UUID)

	new_net = Rackconnect::CloudNetwork.create{...})

	new_net.destroy


## Models
* CloudNetwork
* LoadBalancerPool
* LoadBalancerPoolNode
* LoadBalancerPoolNodeDetails
* Public IPs
* ServerGroup
* ServerGroupNode
* ServerGroupNodeDetails

## Notes
* Rackconnect will only work with the RackConnect v3 API (current)

## Tech Info
* [Main Docs](http://www.rackspace.com/knowledge_center/getting-started/rackconnect)
* [API Docs](http://docs.rcv3.apiary.io/)
* [FAQ](http://www.rackspace.com/knowledge_center/article/rackconnect-v30-faq)
* [Limitations](http://www.rackspace.com/knowledge_center/article/rackconnect-v30-limitations)
* [Requirements](http://www.rackspace.com/knowledge_center/article/rackconnect-v30-requirements)
* [Support](http://www.rackspace.com/knowledge_center/article/getting-rackconnect-support)
