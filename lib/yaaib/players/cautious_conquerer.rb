module YaAIB
  module Players
    class CautiousConquerer < YaAIB::Player
      def think(interface)
        targets = interface.enemy_planets + interface.neutral_planets
        interface.allied_planets.each do |planet|
          targets.sort_by { |target| planet.distance_to(target) }.each do |target|
            break if planet.supply <= minimum_defense(planet)
            needed_force = [0, 1 + supply_balance_for(target, interface)].max
            sent_force = [planet.supply, needed_force].min
            interface.send_fleet(source: planet, target: target, size: sent_force)
          end
        end
      end

      def author
        'NobodysNightmare'
      end

      def color
        [255, 165, 0]
      end

      private

      def minimum_defense(planet)
        5
      end

      def supply_balance_for(planet, interface)
        arriving = interface.fleets.select { |fleet| fleet.target == planet }
        hostile = arriving.select { |f| f.owner != planet.owner }.map { |f| f.size }.reduce(:+) || 0
        allied = arriving.select { |f| f.owner == planet.owner }.map { |f| f.size }.reduce(:+) || 0
        planet.supply + planet.regeneration + allied - hostile
      end
    end
  end
end
