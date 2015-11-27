module YaAIB
  module Players
    class DumbFirePlayer < YaAIB::Player
      def think(interface)
        targets = interface.enemy_planets + interface.neutral_planets
        interface.allied_planets.each do |planet|
          next unless planet.supply > 0
          next if targets.empty?
          sorted_targets = targets.sort_by { |target| planet.distance_to(target) }
          interface.send_fleet(source: planet, target: sorted_targets.first, size: planet.supply)
        end
      end

      def name
        self.class.name
      end
    end
  end
end
