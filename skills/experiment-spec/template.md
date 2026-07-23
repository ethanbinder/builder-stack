# [Product/Feature Name] — Experiment Spec

## Hypothesis

- If we [change], then [metric] will [improve/not regress] because [reason].

## Test Design

### Test Variables

| Dimension | Value |
|-----------|-------|
| [Variable 1] | [Treatment description] |

### Cell Structure

| Cell | Description | Allocation |
|------|-------------|------------|
| Control | Current experience | 50% |
| Treatment | New experience | 50% |

### Randomization

- Unit of randomization (user, session, device)
- Stratification if applicable

## Metrics

### Success Metrics

| Metric | Direction | MDE |
|--------|-----------|-----|
| [Primary metric] | Increase | [X%] |

### Guardrail Metrics

| Metric | Threshold |
|--------|-----------|
| DAU | No significant decrease |
| Crash rate | No significant increase |

### Learning Metrics

- Metrics we're tracking for insights, not for ship/no-ship decisions

## Risks and Dependencies

- What could invalidate the experiment?
- Sample size and duration requirements

## Decision Framework

- Ship if: [criteria]
- Iterate if: [criteria]
- Kill if: [criteria]
