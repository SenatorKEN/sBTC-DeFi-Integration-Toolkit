;; Additional error constants for new features
(define-constant err-proposal-not-found (err u109))
(define-constant err-voting-ended (err u110))
(define-constant err-already-voted (err u111))
(define-constant err-insufficient-voting-power (err u112))
(define-constant err-loan-not-found (err u113))
(define-constant err-loan-not-due (err u114))
(define-constant err-insufficient-collateral (err u115))
(define-constant err-vault-not-found (err u116))
(define-constant err-invalid-signature (err u117))
(define-constant err-nft-not-found (err u118))
(define-constant err-auction-ended (err u119))
(define-constant err-invalid-bid (err u120))

;; Additional data variables for new features
(define-data-var next-proposal-id uint u1)
(define-data-var next-loan-id uint u1)
(define-data-var next-vault-id uint u1)
(define-data-var next-auction-id uint u1)
(define-data-var governance-token-supply uint u1000000)
(define-data-var min-proposal-threshold uint u10000)
(define-data-var voting-period uint u1440) ;; 1440 blocks (~24 hours)

(define-map governance-proposals
  { proposal-id: uint }
  {
    proposer: principal,
    title: (string-ascii 100),
    description: (string-ascii 500),
    proposal-type: (string-ascii 20),
    target-value: uint,
    votes-for: uint,
    votes-against: uint,
    status: (string-ascii 20),
    created-at: uint,
    voting-ends-at: uint,
    execution-delay: uint
  }
)

(define-map governance-votes
  { proposal-id: uint, voter: principal }
  {
    vote-power: uint,
    vote-direction: bool, ;; true = for, false = against
    voted-at: uint
  }
)

(define-map governance-tokens
  { holder: principal }
  {
    balance: uint,
    delegated-to: (optional principal),
    voting-power: uint,
    last-delegation-change: uint
  }
)
