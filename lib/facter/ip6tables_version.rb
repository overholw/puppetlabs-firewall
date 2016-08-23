Facter.add(:ip6tables_version) do
  has_weight 100
  confine :operatingsystem => 'RedHat'
  confine :lsbmajdistrelease => 5
  setcode do
    version = Facter::Util::Resolution.exec('ip6tables --version')
    if version
      if (/1\.3\./ =~ version )
        ""
      else
        version.match(/\d+\.\d+\.\d+/).to_s
      end
    else
      nil
    end
  end
end


Facter.add(:ip6tables_version) do
  has_weight 1
  confine :kernel => :linux
  setcode do
    version = Facter::Util::Resolution.exec('ip6tables --version')
    if version
      version.match(/\d+\.\d+\.\d+/).to_s
    else
      nil
    end
  end
end
