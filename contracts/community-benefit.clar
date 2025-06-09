;; Community Benefit Contract
;; This contract ensures tourism community benefits

(define-data-var admin principal tx-sender)

;; Define benefit categories
(define-constant LOCAL_EMPLOYMENT u1)
(define-constant LOCAL_SOURCING u2)
(define-constant COMMUNITY_PROJECTS u3)
(define-constant CULTURAL_PRESERVATION u4)

;; Data map to store community benefit reports
(define-map benefit-reports
  {
    operator-id: (string-utf8 36),
    report-id: (string-utf8 36)
  }
  {
    local-employment-percentage: uint,
    local-sourcing-percentage: uint,
    community-projects-count: uint,
    cultural-preservation-initiatives: uint,
    report-date: uint,
    reporter: principal
  }
)

;; Data map to store community benefit targets
(define-map benefit-targets
  { operator-id: (string-utf8 36) }
  {
    local-employment-target: uint,
    local-sourcing-target: uint,
    community-projects-target: uint,
    cultural-preservation-target: uint,
    target-date: uint
  }
)

;; Public function to submit a community benefit report
(define-public (submit-benefit-report
    (operator-id (string-utf8 36))
    (report-id (string-utf8 36))
    (local-employment-percentage uint)
    (local-sourcing-percentage uint)
    (community-projects-count uint)
    (cultural-preservation-initiatives uint))
  (ok (map-set benefit-reports
    {
      operator-id: operator-id,
      report-id: report-id
    }
    {
      local-employment-percentage: local-employment-percentage,
      local-sourcing-percentage: local-sourcing-percentage,
      community-projects-count: community-projects-count,
      cultural-preservation-initiatives: cultural-preservation-initiatives,
      report-date: block-height,
      reporter: tx-sender
    }
  ))
)

;; Public function to set community benefit targets
(define-public (set-benefit-targets
    (operator-id (string-utf8 36))
    (local-employment-target uint)
    (local-sourcing-target uint)
    (community-projects-target uint)
    (cultural-preservation-target uint)
    (target-date uint))
  (ok (map-set benefit-targets
    { operator-id: operator-id }
    {
      local-employment-target: local-employment-target,
      local-sourcing-target: local-sourcing-target,
      community-projects-target: community-projects-target,
      cultural-preservation-target: cultural-preservation-target,
      target-date: target-date
    }
  ))
)

;; Public function to get benefit report
(define-read-only (get-benefit-report (operator-id (string-utf8 36)) (report-id (string-utf8 36)))
  (map-get? benefit-reports { operator-id: operator-id, report-id: report-id })
)

;; Public function to get benefit targets
(define-read-only (get-benefit-targets (operator-id (string-utf8 36)))
  (map-get? benefit-targets { operator-id: operator-id })
)

;; Public function to check if operator is meeting their community benefit targets
(define-read-only (is-meeting-targets (operator-id (string-utf8 36)) (report-id (string-utf8 36)))
  (let (
    (report (map-get? benefit-reports { operator-id: operator-id, report-id: report-id }))
    (targets (map-get? benefit-targets { operator-id: operator-id }))
  )
    (if (and (is-some report) (is-some targets))
      (and
        (>= (get local-employment-percentage (unwrap-panic report)) (get local-employment-target (unwrap-panic targets)))
        (>= (get local-sourcing-percentage (unwrap-panic report)) (get local-sourcing-target (unwrap-panic targets)))
        (>= (get community-projects-count (unwrap-panic report)) (get community-projects-target (unwrap-panic targets)))
        (>= (get cultural-preservation-initiatives (unwrap-panic report)) (get cultural-preservation-target (unwrap-panic targets)))
      )
      false
    )
  )
)

;; Admin function to transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (if (is-eq tx-sender (var-get admin))
    (ok (var-set admin new-admin))
    (err u1) ;; Error: Not authorized
  )
)
