module MyModule::EnergyUsageTracker {

    use aptos_framework::signer;

    /// Struct representing a user's energy usage.
    struct EnergyUsage has store, key {
        total_energy: u64,  // Total energy consumed by the user in kilowatt-hours (kWh)
    }

    /// Function to record energy consumption for the user.
    public fun record_energy_usage(user: &signer, energy_consumed: u64) {
        let usage = EnergyUsage {
            total_energy: energy_consumed,
        };
        move_to(user, usage);
    }

    /// Function to retrieve the user's total energy consumption.
    public fun get_energy_usage(user: address): u64 acquires EnergyUsage {
        let usage = borrow_global<EnergyUsage>(user);
        usage.total_energy
    }
}
