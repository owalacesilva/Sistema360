class PointsDistributionInteractor
  include Interactor::Organizer

  organize Commissions::InitialInteractor, Commissions::MatchingBonusInteractor
end
