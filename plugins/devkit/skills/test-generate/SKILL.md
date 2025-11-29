---
description: USE THIS SKILL when users ask to generate or write tests for code/files/functions, create test cases or test suites, add unit/integration/e2e tests, improve test coverage, or test specific features or components
---

# Test Generation with Strategic Intelligence

## Required Information

### Optional (with defaults)
- **files**: File path or pattern to test. Defaults to staged changes.
- **strategy**: Test strategy. Defaults to "integration". Options: auto, integration, unit, mixed, e2e
- **framework**: Override auto-detected framework (jest, xunit, pytest, vitest)
- **coverage**: Minimum coverage target. Defaults to 85%.
- **complexity_threshold**: Complexity score triggering unit tests. Defaults to 8.
- **implement**: Generate fully implemented tests. Defaults to true.
- **skeleton**: Generate skeleton tests only. Defaults to false.
- **update**: Patch existing tests by adding missing cases. Defaults to false.
- **from_bdd**: Generate tests from BDD scenarios in specification files. Defaults to false.
- **spec_file**: Path to specification file containing BDD scenarios.
- **force_level**: Force specific test level (unit, integration, e2e).
- **mock_boundary**: Control mocking level. Defaults to "external-only". Options: external-only, all-dependencies

If the user specifies files to test, use those directly. Otherwise, test staged changes.

## Instructions

### Action 1: Analyze Code Complexity

**Think thoroughly and in great detail** about analyzing code complexity to determine test strategy.
Consider complexity metrics, dependency boundaries, critical paths, and risk assessment.

**IDENTIFY** files to test:
- If files were provided: Use the provided file pattern
- Otherwise: Execute `git diff --cached --name-only` to find staged files

**READ** each file for the purpose of:
- Calculating complexity metrics (cyclomatic, nesting, branching) for each function/method
- Identifying external dependencies that need mocking (APIs, databases, file systems)
- Finding critical business logic requiring focused testing
- Detecting edge cases and error handling scenarios
- Understanding data flow and transformation points

### Action 2: Select Test Strategy

**Think hard** about selecting the optimal test strategy.
Consider complexity scores, test type mix, and maintenance vs coverage tradeoffs.

Analyze code to determine optimal strategy:
```
complexity_score = cyclomatic_complexity + nesting_depth + branching_factor

if (complexity_score > [complexity_threshold]):
  → Unit tests for complex logic
if (external_dependencies.count > 0):
  → Integration tests with boundary mocking
if (user_facing_component):
  → E2E smoke test for critical paths
```

### What to Mock (External Dependencies ONLY)

**Mock these external dependencies:**
- External APIs (DataflowService, PublisherService, third-party APIs)
- Databases and storage (BlobService, S3, MongoDB, PostgreSQL)
- Authentication services (TokenService, PermissionService, OAuth providers)
- File system operations (fs, fs/promises)
- Third-party libraries (ClsService, external SDKs)
- Infrastructure services (Logger for test output control)
- Message queues and event streams (Kafka, RabbitMQ, SQS)

### What NOT to Mock (Use Real Implementations)

**Use real implementations for:**
- Internal services (IngestionOrchestratorService, FileProcessorService, etc.)
- Internal factories (ExternalServiceClientFactory)
- Business logic services
- Schema managers and validators
- Data transformation utilities
- Any service that is part of your codebase

### Test Structure Pattern (Arrange-Act-Assert)

```typescript
describe('ServiceName - Integration tests', () => {
  let service: ServiceName;
  let mockExternalApi: any;

  beforeEach(async () => {
    // Arrange: Mock only external dependencies
    mockExternalApi = {
      externalMethod: vi.fn().mockResolvedValue(mockData),
    };

    const module = await Test.createTestingModule({
      providers: [
        ServiceName,
        InternalService1, // Real implementation
        InternalService2, // Real implementation
        {
          provide: ExternalApiService,
          useValue: mockExternalApi, // Mocked external dependency
        },
      ],
    }).compile();

    service = module.get<ServiceName>(ServiceName);
  });

  it('should successfully process data - happy flow', async () => {
    // Arrange
    const input = { /* valid test data */ };

    // Act
    const result = await service.process(input);

    // Assert
    expect(result).toBeDefined();
    expect(mockExternalApi.externalMethod).toHaveBeenCalled();

    // Verify no validation warnings in happy flow
    expect(mockLogger.warn).not.toHaveBeenCalled();

    // Verify successful processing
    expect(result.status).toBe('success');
  });
});
```

### Phase 1: Intelligent Analysis & Strategic Planning

**ANALYZE** in parallel:
- Code complexity metrics (cyclomatic, cognitive, nesting)
- External dependency boundaries
- Critical business logic identification
- Test value assessment

**Strategic Test Selection**:
- If force_level provided: Use forced level tests as requested
- If mock_boundary is "external-only" (default):
  - **Integration tests** (default): Real service instances, mock only external boundaries
  - **Unit tests**: Only for methods with complexity > threshold or pure algorithmic logic
  - **E2E tests**: For critical user journeys with score > 15
- If mock_boundary is "all-dependencies": Traditional approach - mock all dependencies

If from_bdd is enabled:
### BDD Scenario Analysis

- **Scenario Discovery**: Parse specification files for Given/When/Then scenarios
- **Test Mapping**: Convert each scenario into executable test cases
- **Data Extraction**: Extract test data from scenario examples
- **Assertion Generation**: Create assertions matching "Then" statements

### Phase 2: Integration Test Implementation

**Test Structure Following Arrange-Act-Assert**:

```typescript
describe('Feature Name - Integration tests', () => {
  let service: ActualService;
  let internalDependency: InternalService; // Real implementation
  let mockExternalApi: any; // Mocked external dependency

  beforeEach(async () => {
    // Arrange: Set up test module with real internals, mock externals
    mockExternalApi = {
      fetchData: vi.fn().mockResolvedValue(externalData),
    };

    const module = await Test.createTestingModule({
      providers: [
        ActualService,
        InternalService, // Real implementation
        DataTransformer, // Real implementation
        Validator,       // Real implementation
        {
          provide: ExternalApiClient,
          useValue: mockExternalApi, // Mock only external
        },
      ],
    }).compile();

    service = module.get<ActualService>(ActualService);
  });

  describe('Happy Path - No Validation Warnings', () => {
    it('should process valid data through full stack without warnings', async () => {
      // Arrange
      const validInput = createValidTestData();

      // Act
      const result = await service.processData(validInput);

      // Assert - Business logic
      expect(result.status).toBe('success');
      expect(result.data).toMatchObject(expectedOutput);

      // Assert - No validation warnings in happy path
      expect(mockLogger.warn).not.toHaveBeenCalled();
      expect(mockLogger.error).not.toHaveBeenCalled();
    });
  });
});
```

### Phase 3: Framework Selection

Auto-detect based on project:
- TypeScript/JavaScript → Vitest (preferred) or Jest
- C# → xUnit or NUnit
- Python → Pytest
- Java → JUnit or TestNG
- Go → Native testing package

Or use the specified framework if provided.

### Phase 3: Intelligent Execution

**PRESENT** test strategy analysis:
```
📊 Test Strategy Analysis:
Files analyzed: [count]
Complexity scores: [min-max range]

Recommended distribution:
- Integration tests: X (for complete flows)
- Unit tests: Y (complexity > threshold)
- E2E tests: Z (critical paths only)

External dependencies to mock:
- [list of identified external deps]
```

**USE AskUserQuestion** to confirm:
- Question: "Generate these tests?"
- Options:
  - "Yes, generate" - Create the test files
  - "Cancel" - Abort test generation

**IF** user provides custom input (via "Other"):
  **NEVER** generate tests directly - custom input means the user wants to refine, not confirm
  **ADJUST** the strategy based on their feedback
  **PRESENT** the updated test strategy in full
  **CALL AskUserQuestion again** with the same options
  **LOOP** until user explicitly selects "Yes, generate" or "Cancel"

### Action 3: Generate or Extend Test Files

**ANALYZE** existing test files to identify extension opportunities
**EXTEND** existing test suites when possible rather than creating parallel files
**CREATE** new test files only when necessary for organization
**IMPLEMENT** test cases following existing project test patterns
**ENSURE** coverage targets are met by building on existing test infrastructure

### Action 4: Report Results

**RESPOND** with:
```
✅ Strategic test generation complete:
- [X] test files created ([total] tests)
- Complexity analysis: [summary]
- Coverage estimate: [percentage]%
- Strategy: [integration-first/mixed/unit-heavy]
```

## Integration-First Best Practices

1. **Real Behavior Over Mocks**: Use actual implementations to catch real bugs
2. **Arrange-Act-Assert Pattern**: Clear three-phase test structure
3. **Happy Path Validation**: Ensure no warnings/errors in successful flows
4. **Meaningful Assertions**: Verify business logic, not just method calls
5. **External Boundary Mocking**: Only mock at system boundaries
6. **Realistic Test Data**: Use complete, valid data that satisfies all validations
7. **Integration Over Isolation**: Test how components work together

## Quick Reference

1. ANALYZE code complexity (cyclomatic, nesting, dependencies)
2. SELECT optimal test strategy based on analysis
3. PRESENT strategy to user and WAIT for confirmation
4. CREATE test files with strategic coverage
5. PRIORITIZE integration tests with external-only mocking
