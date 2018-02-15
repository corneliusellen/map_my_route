module ApplicationHelper

  def fuel_types
    {
      'Electric' => 'ELEC',
      'Ethanol' => 'E85',
      'Biodiesel' => 'BD',
      'Compresses Natural Gas' => 'CNG',
      'Liquified Natural Gas' => 'LNG',
      'Hydrogen' => 'HY',
      'Propane' => 'LPG'
    }
  end
end
